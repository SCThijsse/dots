-- gitgutter

local opts = { noremap = true, silent = true }

vim.api.nvim_set_option('updatetime', 500)

vim.api.nvim_set_keymap('n', '<leader>ub', [[:GitGutterBufferToggle<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>uh', [[:GitGutterLineHighlightsToggle<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>us', [[:GitGutterSignsToggle<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>ut', [[:GitGutterToggle<CR>]], opts)
