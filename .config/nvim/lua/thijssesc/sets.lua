-- sets

local utils = require('thijssesc.utils')

local opt = utils.opt

-- global options
opt('o', 'hidden', true)          --
opt('o', 'backup', false)         --
opt('o', 'writebackup', false)    --
opt('o', 'swapfile', false)       --
opt('o', 'showcmd', false)        -- show incomplete cmds down the bottom
opt('o', 'showmode', false)       -- do not show current mode down the bottom
opt('o', 'scrolloff', 4)          -- give some space at the top and bottom
opt('o', 'splitbelow', true)      -- split below instead of on top
opt('o', 'splitright', true)      -- split to the right instead of the left

-- window options
opt('w', 'cursorline', true)     -- enable cursor line
opt('w', 'number', true)         -- enable line numbers
opt('w', 'relativenumber', true) -- enable relative line numbers

-- indent options
opt('b', 'shiftwidth', 2)         -- change the number of space charaters inserted for indentation
opt('b', 'tabstop', 2)            -- insert 2 spaces for a tab
opt('b', 'softtabstop', 2)        --
opt('b', 'expandtab', true)       -- converts tabs to spaces
-- opt('b', 'autoindent', true)      -- good auto indent
opt('b', 'smartindent', true)     --

