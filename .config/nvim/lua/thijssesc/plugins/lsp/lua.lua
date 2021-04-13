-- lua lsp

local lspconfig = require('lspconfig')
local on_attach = require('thijssesc.plugins.lsp.on_attach')

local sumneko_root_path = vim.fn.getenv('HOME')..'/Software/lua-language-server'
local sumneko_binary = sumneko_root_path..'/bin/Linux/lua-language-server'

lspconfig.sumneko_lua.setup {
    cmd = { sumneko_binary, '-E', sumneko_root_path..'/main.lua' },
    settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ','),
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
  on_attach = on_attach,
}
