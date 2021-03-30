-- nvim-tree

local tree = require('nvim-tree')
local utils = require('utils')

local nnoremap = utils.keymap.nnoremap

vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 0,
    files = 0,
}

nnoremap { '<leader><BS>', tree.toggle }
