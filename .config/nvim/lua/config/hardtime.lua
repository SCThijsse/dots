-- hardtime

vim.g.hardtime_default_on = 0
vim.g.hardtime_maxcount = 2
vim.g.hardtime_ignore_quickfix = 1
vim.g.hardtime_allow_different_key = 1

vim.g.list_of_normal_keys = {'w', 'b', 'h', 'j', 'k', 'l', '-', '+', '<UP>', '<DOWN>', '<LEFT>', '<RIGHT>'}
vim.g.list_of_visual_keys = {'w', 'b', 'h', 'j', 'k', 'l', '-', '+', '<UP>', '<DOWN>', '<LEFT>', '<RIGHT>'}
vim.g.list_of_insert_keys = {'<UP>', '<DOWN>', '<LEFT>', '<RIGHT>'}
vim.g.list_of_disabled_keys = {}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>at', [[:HardTimeToggle<CR>]], opts)
