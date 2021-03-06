-- javascript lsp

local lspconfig = require('lspconfig')
local on_attach = require('thijssesc.plugins.lsp.on_attach')

lspconfig.tsserver.setup { on_attach = on_attach }
lspconfig.gopls.setup {
    cmd = { 'gopls', '--remote=auto' },
    on_attach = on_attach
}

