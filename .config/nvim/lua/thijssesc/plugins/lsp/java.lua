-- java

local jdtls = require('jdtls')
local jdtls_setup = require('jdtls.setup')
local on_attach = require('thijssesc.plugins.lsp.on_attach')
local utils = require('thijssesc.utils')

local nnoremap = utils.keymap.nnoremap
local vnoremap = utils.keymap.vnoremap

local on_jdtls_attach = function(client, bufnr)
    on_attach(client, bufnr)

    nnoremap { '<A-CR>',      jdtls.code_action }
    vnoremap { '<A-CR>',      function() jdtls.code_action(true) end }
    nnoremap { '<leader>ca',  function() jdtls.code_action(false, 'refactor') end }
    nnoremap { '<leader>cri', jdtls.organize_imports }
    nnoremap { '<leader>crv', [[:lua require('jdtls').extract_variable()<CR>]] }
    vnoremap { '<leader>crv', [[<Esc>:lua require('jdtls').extract_variable(true)<CR>]] }
    vnoremap { '<leader>crm', [[<Esc>:lua require('jdtls').extract_method(true)<CR>]] }
    nnoremap { '<leader>df',  jdtls.test_class }
    nnoremap { '<leader>dn',  jdtls.test_nearest_method }

    jdtls.setup_dap()
end

jdtls.start_or_attach {
     cmd = { 'jdtls' },
     bundles = {
         vim.fn.glob('~/Software/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar')
     },
     root_dir = jdtls_setup.find_root { 'gradle.build', 'pom.xml' },
     on_attach = on_jdtls_attach,
 }
