-- telescope
require('thijssesc.telescope')

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>fc', [[:lua require('telescope.builtin').git_commits()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>fo', [[:lua require('telescope.builtin').git_bcommits()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>fs', [[:lua require('telescope.builtin').git_status()<CR>]], opts)

vim.api.nvim_set_keymap('n', '<leader>fb', [[:lua require('thijssesc.telescope').git_branches()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>fd', [[:lua require('thijssesc.telescope').dot_files()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>ff', [[:lua require('thijssesc.telescope').find_files()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>fg', [[:lua require('thijssesc.telescope').live_grep()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>fr', [[:lua require('thijssesc.telescope').git_files()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>fu', [[:lua require('thijssesc.telescope').buffers()<CR>]], opts)
