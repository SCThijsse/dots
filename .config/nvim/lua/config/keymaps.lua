-- keymaps
vim.g.mapleader = ' '

local opts = { noremap = true, silent = true }

-- reload nvim configurations
vim.api.nvim_set_keymap('n', '<leader>r', [[:source $MYVIMRC<CR>]], opts)

-- paste from clipboard
vim.api.nvim_set_keymap('n', '<leader>p',  [["+p]], opts)
vim.api.nvim_set_keymap('n', '<leader>P',  [["+P]], opts)
-- copy (file) to clipboard
vim.api.nvim_set_keymap('n', '<leader>y',  [["+y]], opts)
vim.api.nvim_set_keymap('n', '<leader>Y',  [["+Y]], opts)
vim.api.nvim_set_keymap('n', '<leader>YY', [[gg"+yG]], opts)

-- unmap arrow keys
vim.api.nvim_set_keymap('n', '<down>',  [[:move +1<CR>]], opts)
vim.api.nvim_set_keymap('n', '<left>',  [[<Nop>]], opts)
vim.api.nvim_set_keymap('n', '<right>', [[<Nop>]], opts)
vim.api.nvim_set_keymap('n', '<up>',    [[:move -2<CR>]], opts)
vim.api.nvim_set_keymap('n', '<down>',  [[<Nop>]], opts)
vim.api.nvim_set_keymap('n', '<left>',  [[<Nop>]], opts)
vim.api.nvim_set_keymap('n', '<right>', [[<Nop>]], opts)
vim.api.nvim_set_keymap('n', '<up>',    [[<Nop>]], opts)

-- auto-center
vim.api.nvim_set_keymap('n', 'G', [[Gzz]], opts)
vim.api.nvim_set_keymap('n', 'n', [[nzz]], opts)
vim.api.nvim_set_keymap('n', 'N', [[Nzz]], opts)
vim.api.nvim_set_keymap('n', '{', [[{zz]], opts)
vim.api.nvim_set_keymap('n', '}', [[}zz]], opts)

-- better indents
vim.api.nvim_set_keymap('v', '<', [[<gv]], opts)
vim.api.nvim_set_keymap('v', '>', [[>gv]], opts)

-- moving lines vertically
vim.api.nvim_set_keymap('x', 'J', [[:move '>+1<CR>gv-gv]], opts)
vim.api.nvim_set_keymap('x', 'K', [[ :move '<-2<CR>gv-gv]], opts)

-- sorting
vim.api.nvim_set_keymap('n', '<leader>so', [[vip:'<,'>sort ui<CR>]], opts)

-- spell-checking
vim.api.nvim_set_keymap('', '<leader>se', [[:setlocal spell! spellang=en_us<CR>]], opts)
vim.api.nvim_set_keymap('', '<leader>sn', [[:setlocal spell! spellang=nl_nl<CR>]], opts)

-- cycle buffers
vim.api.nvim_set_keymap('n', '<Tab>',   [[:bnext<CR>]], opts)
vim.api.nvim_set_keymap('n', '<A-Tab>', [[:bprev<CR>]], opts)

-- switch buffers
vim.api.nvim_set_keymap('n', '<C-h>', [[<C-w>h]], opts)
vim.api.nvim_set_keymap('n', '<C-j>', [[<C-w>j]], opts)
vim.api.nvim_set_keymap('n', '<C-k>', [[<C-w>k]], opts)
vim.api.nvim_set_keymap('n', '<C-l>', [[<C-w>l]], opts)

-- resize buffers
vim.api.nvim_set_keymap('n', '<A-C-h>', [[:resize -<CR>2]], opts)
vim.api.nvim_set_keymap('n', '<A-C-j>', [[:resize +<CR>2]], opts)
vim.api.nvim_set_keymap('n', '<A-C-k>', [[:vertical resize -2<CR>]], opts)
vim.api.nvim_set_keymap('n', '<A-C-l>', [[:vertical resize +2<CR>]], opts)

-- creating terminal buffers
vim.api.nvim_set_keymap('n', '<leader>ts', [[:split <Bar> resize 15 <Bar> terminal<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>tv', [[:vsplit <Bar> terminal<CR>]], opts)

-- easy switching from/into terminal buffers
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], opts)
vim.api.nvim_set_keymap('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
vim.api.nvim_set_keymap('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts)
vim.api.nvim_set_keymap('t', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
vim.api.nvim_set_keymap('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
vim.api.nvim_set_keymap('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts)
vim.api.nvim_set_keymap('t', '<C-d>', [[<C-\><C-n><C-w>:q<CR>]], opts)

-- try to unlearn a nasty habbit
vim.api.nvim_set_keymap('v', 'd',   [[<Nop>]], opts)
vim.api.nvim_set_keymap('v', 'y',   [[<Nop>]], opts)
vim.api.nvim_set_keymap('n', 'dwy', [[<Nop>]], opts)
vim.api.nvim_set_keymap('n', 'diw', [[<Nop>]], opts)
