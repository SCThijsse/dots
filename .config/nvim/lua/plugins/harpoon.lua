-- harpoon

local harpoon = require('harpoon')
local mark = require('harpoon.mark')
local term = require('harpoon.term')
local ui = require('harpoon.ui')
local utils = require('utils')

local nnoremap = utils.keymap.nnoremap

harpoon.setup {}

nnoremap { '<C-m>', mark.add_file }
nnoremap { '<C-t>', ui.toggle_quick_menu }
nnoremap { '<C-w>', mark.rm_file }

nnoremap { '<leader>tt', function() term.gotoTerminal(1) end }
nnoremap { '<leader>hh', function() ui.nav_file(1) end }
nnoremap { '<leader>jj', function() ui.nav_file(2) end }
nnoremap { '<leader>kk', function() ui.nav_file(3) end }
nnoremap { '<leader>ll', function() ui.nav_file(4) end }

