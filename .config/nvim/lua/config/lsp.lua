-- lsp

vim.cmd [[filetype plugin on]]

vim.api.nvim_set_option('omnifunc', 'syntaxcomplete#Complete')
vim.api.nvim_set_option('completeopt', 'menuone,noinsert,noselect')

local opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap('n', '<leader>db', [[:action Back<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>dd', [[:lua vim.lsp.buf.definition()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>de', [[:lua vim.lsp.buf.formatting()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>df', [[:lua vim.lsp.buf.references()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>dh', [[:lua vim.lsp.buf.hover()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>di', [[:lua vim.lsp.buf.implementation()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>dl', [[:lua vim.lsp.diagnostic.set_loclist()<CR>]], opts)
-- vim.api.nvim_set_keymap('n', '<leader>dm', [[:action ImplementMethod<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>dn', [[:lua vim.lsp.diagnostic.goto_next()<CR>]], opts)
-- vim.api.nvim_set_keymap('n', '<leader>do', [[:action OverrideMethods<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>dp', [[:lua vim.lsp.diagnostic.goto_prev()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>dr', [[:lua vim.lsp.buf.rename()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>ds', [[:action SelectInProjectView<CR>]], opts)

opts = vim.tbl_extend('force', { expr = true }, opts)
vim.api.nvim_set_keymap('i', '<Tab>',   [[pumvisible() ? '<C-n>' : '<Tab>']], opts)
vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? '<C-p>' : '<-STab>']], opts)

vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }
require('lspconfig').tsserver.setup {
    on_attach = require('completion').on_attach
}

