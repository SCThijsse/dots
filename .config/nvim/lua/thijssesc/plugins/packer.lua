-- packer

local packer = require('packer')
local utils = require('thijssesc.utils')

local nnoremap = utils.keymap.nnoremap

nnoremap { '<leader>uc', packer.clean }
nnoremap { '<leader>uC', packer.compile }
nnoremap { '<leader>ui', packer.install }
nnoremap { '<leader>us', packer.sync }
nnoremap { '<leader>uu', packer.update }

