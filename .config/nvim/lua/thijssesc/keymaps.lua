-- keymaps

local utils = require('thijssesc.utils')

local nnoremap = utils.keymap.nnoremap
local noremap  = utils.keymap.noremap
local tnoremap = utils.keymap.tnoremap

vim.g.mapleader = ' '

-- reload config
nnoremap { '<leader>rr', ':so $MYVIMRC' }

-- stop the search highlighting if enabled. source: tj
nnoremap { '<CR>', [[{-> v:hlsearch ? ':nohl<CR>' : '<CR>'}()]], expr = true }

-- paste from clipboard
nnoremap { '<leader>p', '"+p' }
nnoremap { '<leader>P', '"+P' }
-- copy (file) to clipboard
nnoremap { '<leader>y', '"+y' }
nnoremap { '<leader>Y', 'gg"+yG' }

-- unmap arrow keys
noremap { '<Dowp>',  '<Nop>' }
noremap { '<Left>',  '<Nop>' }
noremap { '<Right>', '<Nop>' }
noremap { '<Up>',    '<Nop>' }

-- auto-center
nnoremap { 'G', 'Gzz' }
nnoremap { 'n', 'nzz' }
nnoremap { 'N', 'Nzz' }

-- sorting
nnoremap { '<leader>so', [[vip:'<,'>sort ui<CR>]] }

-- spell-checking
nnoremap { '<leader>se', ':setlocal spell! spelllang=en_us<CR>' }
nnoremap { '<leader>sn', ':setlocal spell! spelllang=nl_nl<CR>' }

-- switch buffers
nnoremap { '<C-h>', '<C-w>h' }
nnoremap { '<C-j>', '<C-w>j' }
nnoremap { '<C-k>', '<C-w>k' }
nnoremap { '<C-l>', '<C-w>l' }

-- resize splits
nnoremap { '<A-C-h>', ':vertical resize -2<CR>' }
nnoremap { '<A-C-j>', ':resize +2<CR>' }
nnoremap { '<A-C-k>', ':resize -2<CR>' }
nnoremap { '<A-C-l>', ':vertical resize +2<CR>' }

-- easy switching from/into terminal buffers
tnoremap { '<Esc>', [[<C-\><C-n>]] }
tnoremap { '<C-w>', [[<C-\><C-n><C-w>]] }
tnoremap { '<C-h>', [[<C-\><C-n><C-w>h]] }
tnoremap { '<C-j>', [[<C-\><C-n><C-w>j]] }
tnoremap { '<C-k>', [[<C-\><C-n><C-w>k]] }
tnoremap { '<C-l>', [[<C-\><C-n><C-w>l]] }
tnoremap { '<C-d>', [[<C-\><C-n><C-w>:q<CR>]] }

-- I hate this
nnoremap { 'q:', '<Nop>' }

-- cycle through qflist and localtion list
nnoremap { ']q', ':cnext<CR>' }
nnoremap { '[q', ':cprev<CR>' }
nnoremap { ']l', ':lnext<CR>' }
nnoremap { '[l', ':lprev<CR>' }

-- anti-pattern: cycle through buffers
nnoremap { '[b', ':bprev<CR>' }
nnoremap { ']b', ':bnext<CR>' }

