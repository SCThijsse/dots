-- neogit

local neogit = require('neogit')
local utils = require('thijssesc.utils')

local nnoremap = utils.keymap.nnoremap

neogit.setup { disable_signs = true }

nnoremap { '<leader>gg', neogit.open }
