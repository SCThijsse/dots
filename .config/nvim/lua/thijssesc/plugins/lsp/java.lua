-- java

local jdtls = require('jdtls')
local on_attach = require('thijssesc.plugins.lsp.on_attach')
local utils = require('thijssesc.utils')

local nnoremap = utils.keymap.nnoremap
local vnoremap = utils.keymap.vnoremap

local M = {}

M.on_jdtls_attach = function(client, bufnr)
    on_attach(client, bufnr)

    jdtls.setup_dap()
    jdtls.setup.add_commands()

    nnoremap { '<A-CR>',      jdtls.code_action }
    vnoremap { '<A-CR>',      function() jdtls.code_action(true) end }
    nnoremap { '<leader>ca',  function() jdtls.code_action(false, 'refactor') end }
    nnoremap { '<leader>cri', jdtls.organize_imports }
    nnoremap { '<leader>crv', [[:lua require('jdtls').extract_variable()<CR>]] }
    vnoremap { '<leader>crv', [[<Esc>:lua require('jdtls').extract_variable(true)<CR>]] }
    vnoremap { '<leader>crm', [[<Esc>:lua require('jdtls').extract_method(true)<CR>]] }
    nnoremap { '<leader>df',  jdtls.test_class }
    nnoremap { '<leader>dn',  jdtls.test_nearest_method }

end

M.on_init = function(client)
    if client.config.settings then
        client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
    end
end

M.setup = function()
    local home = os.getenv('HOME')
    local root_dir = jdtls.setup.find_root { '.git', 'gradle.build', 'pom.xml' },

    jdtls.start_or_attach {
        cmd = { 'jdtls' },
        init_options = {
            bundles = {
                vim.fn.glob(home..'/Software/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar'),
                vim.fn.glob(home..'/Software/vscode-java-decompiler/server/*.jar'),
                vim.fn.glob(home..'/Software/vscode-java-test/server/*.jar'),
            },
        },
        root_dir = root_dir,
        on_attach = M.on_jdtls_attach,
        on_init = M.on_init,
        filetypes = { 'java' },
        settings = {
            configuration = {
                runtimes = {
                    {
                        name = 'JavaOpenJDK-8',
                        path = '/usr/lib/jvm/java-8-openjdk/',
                    },
                    -- {
                    --     name = 'JavaOpenJDK-15',
                    --     path = '/usr/lib/jvm/java-15-openjdk/',
                    -- },
                },
            },
        },
    }
 end

return M
