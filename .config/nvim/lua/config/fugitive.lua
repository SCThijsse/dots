-- fugitive
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>gb', [[:Git branch<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gc', [[:Git commit<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gf', [[:Git fetch<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gh', [[:Git push<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gl', [[:Git log<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gm', [[:Git blame<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gp', [[:Git pull<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gr', [[:Git reset --hard<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gs', [[:Git status --long<CR>]], opts)
