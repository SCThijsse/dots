-- keymaps

local utils = require('utils')

local nnoremap = utils.keymap.nnoremap
local tnoremap = utils.keymap.tnoremap
local vnoremap = utils.keymap.vnoremap

vim.g.mapleader = ' '

-- paste from clipboard
nnoremap { '<leader>p',  [["+p]] }
nnoremap { '<leader>P',  [["+P]] }
-- copy (file) to clipboard
nnoremap { '<leader>y',  [["+y]] }
nnoremap { '<leader>Y',  [[gg"+yG]] }

-- unmap arrow keys
nnoremap { '<Down>',  [[<Nop>]] }
nnoremap { '<Left>',  [[<Nop>]] }
nnoremap { '<Right>', [[<Nop>]] }
nnoremap { '<Up>',    [[<Nop>]] }
vnoremap { '<Down>',  [[<Nop>]] }
vnoremap { '<Left>',  [[<Nop>]] }
vnoremap { '<Right>', [[<Nop>]] }
vnoremap { '<Up>',    [[<Nop>]] }

-- auto-center
nnoremap { 'G', [[Gzz]] }
nnoremap { 'n', [[nzz]] }
nnoremap { 'N', [[Nzz]] }
nnoremap { '{', [[{zz]] }
nnoremap { '}', [[}zz]] }
nnoremap { '(', [[(zz]] }
nnoremap { ')', [[)zz]] }

-- sorting
nnoremap { '<leader>so', [[vip:'<,'>sort ui<CR>]] }

-- spell-checking
nnoremap { '<leader>se', [[:setlocal spell! spelllang=en_us<CR>]] }
nnoremap { '<leader>sn', [[:setlocal spell! spelllang=nl_nl<CR>]] }

-- switch buffers
nnoremap { '<C-h>', [[<C-w>h]] }
nnoremap { '<C-j>', [[<C-w>j]] }
nnoremap { '<C-k>', [[<C-w>k]] }
nnoremap { '<C-l>', [[<C-w>l]] }

-- resize buffers
nnoremap { '<A-C-h>', [[:resize -2<CR>]] }
nnoremap { '<A-C-j>', [[:resize +2<CR>]] }
nnoremap { '<A-C-k>', [[:vertical resize -2<CR>]] }
nnoremap { '<A-C-l>', [[:vertical resize +2<CR>]] }

-- creating terminal buffers
nnoremap { '<leader>ts', [[:split <Bar> resize 15 <Bar> terminal<CR>]] }
nnoremap { '<leader>tv', [[:vsplit <Bar> terminal<CR>]] }

-- easy switching from/into terminal buffers
tnoremap { '<Esc>', [[<C-\><C-n>]] }
tnoremap { '<C-w>', [[<C-\><C-n><C-w>]] }
tnoremap { '<C-h>', [[<C-\><C-n><C-w>h]] }
tnoremap { '<C-j>', [[<C-\><C-n><C-w>j]] }
tnoremap { '<C-k>', [[<C-\><C-n><C-w>k]] }
tnoremap { '<C-l>', [[<C-\><C-n><C-w>l]] }
tnoremap { '<C-d>', [[<C-\><C-n><C-w>:q<CR>]] }

-- try to unlearn nasty habbits
vnoremap { 'd',   [[<Nop>]] }
vnoremap { 'y',   [[<Nop>]] }
nnoremap { 'dw',  [[<Nop>]] }
nnoremap { 'diw', [[<Nop>]] }

-- stop the search highlighting
nnoremap { '<leader>nh', [[:nohlsearch<CR>]] }
