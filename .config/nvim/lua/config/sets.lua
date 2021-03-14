-- sets

-- global options
vim.api.nvim_set_option('hidden', true)                --
vim.api.nvim_set_option('hlsearch', true)              -- don't highlight searched text
vim.api.nvim_set_option('incsearch', true)             -- find the next match as we type the search
vim.api.nvim_set_option('backup', false)               --
vim.api.nvim_set_option('writebackup', false)          --
vim.api.nvim_set_option('swapfile', false)             --
vim.api.nvim_set_option('showcmd', false)              -- show incomplete cmds down the bottom
vim.api.nvim_set_option('showmode', false)             -- do not show current mode down the bottom
vim.api.nvim_set_option('scrolloff', 4)                -- give some space at the top and bottom
vim.api.nvim_set_option('splitbelow', true)            -- split below instead of on top
vim.api.nvim_set_option('splitright', true)            -- split to the right instead of the left

-- window options
vim.api.nvim_win_set_option(0, 'cursorline', true)     -- enable cursor line
vim.api.nvim_win_set_option(0, 'relativenumber', true) -- enable relative line numbers

-- indent options
vim.api.nvim_buf_set_option(0, 'shiftwidth', 2)               --
vim.api.nvim_buf_set_option(0, 'tabstop', 2)                  --
vim.api.nvim_buf_set_option(0, 'softtabstop', 2)              --
vim.api.nvim_buf_set_option(0, 'expandtab', true)             --
vim.api.nvim_buf_set_option(0, 'autoindent', true)            --

