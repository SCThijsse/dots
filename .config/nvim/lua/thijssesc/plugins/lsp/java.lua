-- java

local jdtls = require('jdtls')
local ui = require('jdtls.ui')
local actions = require('telescope.actions')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')
local utils = require('thijssesc.utils')
local on_attach = require('thijssesc.plugins.lsp.on_attach')

local M = {}

M.on_jdtls_attach = function(client, bufnr)
    on_attach(client, bufnr)

    jdtls.setup_dap()
    jdtls.setup.add_commands()

    local nnoremap = utils.keymap.nnoremap
    local vnoremap = utils.keymap.vnoremap

    nnoremap { '<A-CR>',      jdtls.code_action, buffer = bufnr }
    vnoremap { '<A-CR>',      function() jdtls.code_action(true) end, buffer = bufnr }
    nnoremap { '<leader>ca',  function() jdtls.code_action(false, 'refactor') end, buffer = bufnr }
    nnoremap { '<leader>cri', jdtls.organize_imports, buffer = bufnr }
    nnoremap { '<leader>crv', jdtls.extract_variable, buffer = bufnr }
    vnoremap { '<leader>crv', [[<Esc>:lua require('jdtls').extract_variable(true)<CR>]], buffer = bufnr }
    vnoremap { '<leader>crm', [[<Esc>:lua require('jdtls').extract_method(true)<CR>]], buffer = bufnr }
    nnoremap { '<leader>df',  jdtls.test_class, buffer = bufnr }
    nnoremap { '<leader>dn',  jdtls.test_nearest_method, buffer = bufnr }
end

M.on_init = function(client)
    if client.config.settings then
        client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
    end
end

M.ui = function(items, prompt, label_fn, cb)
    local opts = {}
    pickers.new(opts, {
        prompt_title = prompt,
        finder = finders.new_table {
            results = items,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = label_fn(entry),
                    ordinal = label_fn(entry),
                }
            end,
        },
        sorter = sorters.get_generic_fuzzy_sorter(),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                 local selection = actions.get_selected_entry(prompt_bufnr)
                 actions.close(prompt_bufnr)

                 cb(selection.value)
             end)

            return true
        end,
    }):find()
end

M.setup = function()
    local root_dir = jdtls.setup.find_root { '.git' }
    local home = os.getenv('HOME')

    local jar_patterns = {
        -- home..'/Software/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
        -- home..'/Software/vscode-java-decompiler/server/*.jar',
        -- home..'/Software/vscode-java-test/server/*.jar',
    }
    local bundles = {}
    for _, jar_pattern in ipairs(jar_patterns) do
        for _, bundle in ipairs(vim.split(vim.fn.glob(home .. jar_pattern), '\n')) do
            if not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar') then
                table.insert(bundles, bundle)
            end
        end
    end

    local capabilities = {
        workspace = {
            configuration = true,
        },
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true,
                },
            },
        },
    }

    local extendedClientCapabilities = jdtls.extendedClientCapabilities
    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

    local settings = {
        ['java.format.settings.url'] = home..'/.config/nvim/language-servers/hippo.xml',
        ['java.format.settings.profile'] = 'HippoStyle',
        configuration = {
            signatureHelp = { enabled = true },
            -- contentProvider = { preferred = 'fernflower' },
            completion = {
                favoriteStaticMembers = {
                    -- 'org.hamcrest.MatcherAssert.assertThat',
                    -- 'org.hamcrest.Matchers.*',
                    -- 'org.hamcrest.CoreMatchers.*',
                    'org.junit.jupiter.api.Assertions.*',
                    -- 'java.util.Objects.requireNonNull',
                    -- 'java.util.Objects.requireNonNullElse',
                    'org.mockito.Mockito.*',
                },
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            -- codeGeneration = {
            --     toString = {
            --         template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
            --     },
            -- },
            java = {
                runtimes = {
                    {
                        name = 'JavaOpenJDK-8',
                        path = '/usr/lib/jvm/java-8-openjdk/',
                    },
                    {
                        name = 'JavaOpenJDK-15',
                        path = '/usr/lib/jvm/java-15-openjdk/',
                    },
                },
            },
        },
    }

    local workspace_folder = home..'/workspace/'..vim.fn.fnamemodify(root_dir, ':p:h:t')

    ui.pick_one_async = M.ui
    jdtls.start_or_attach {
        cmd = { 'jdtls', workspace_folder },
        root_dir = root_dir,
        on_attach = M.on_jdtls_attach,
        on_init = M.on_init,
        filetypes = { 'java' },
        flags = { allow_incremental_sync = true },
        init_options = {
          bundles = bundles,
          extendedClientCapabilities = extendedClientCapabilities,
        },
        capabilities = capabilities,
        settings = settings,
    }
 end

return M
