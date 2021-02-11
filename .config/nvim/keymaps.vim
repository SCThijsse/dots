" keymaps
let mapleader = " "

" reload nvim configurations
nnoremap <silent> <leader>r :source $MYVIMRC<CR>

" paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
" copy (file) to clipboard
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>YY gg"+yG

" unmap arrow keys
no  <down>  :move +1<CR>
no  <left>  <Nop>
no  <right> <Nop>
no  <up>    :move -2<CR>
vno <down>  <Nop>
vno <left>  <Nop>
vno <right> <Nop>
vno <up>    <Nop>

" auto-center
nnoremap G Gzz
nnoremap n nzz
nnoremap N Nzz
nnoremap { {zz
nnoremap } }zz

" better indents
vnoremap < <gv
vnoremap > >gv

" moving lines vertically
xnoremap J :move '>+1<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv

" sorting
nnoremap <leader>si vip:'<,'>sort i<CR>
nnoremap <leader>so vip:'<,'>sort<CR>

" spell-checking
map <silent> <leader>se :setlocal spell! spelllang=en_us<CR>
map <silent> <leader>sn :setlocal spell! spelllang=nl_nl<CR>

" cycle buffers
nnoremap <silent> <Tab>   :bnext<CR>
nnoremap <silent> <A-Tab> :bprev<CR>

" switch buffers
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" resize buffers
nnoremap <silent> <A-C-j> :resize -2<CR>
nnoremap <silent> <A-C-k> :resize +2<CR>
nnoremap <silent> <A-C-h> :vertical resize -2<CR>
nnoremap <silent> <A-C-l> :vertical resize +2<CR>

" creating terminal buffers
nnoremap <silent> <leader>ts :split  <Bar> resize 15 <Bar> terminal<CR>
nnoremap <silent> <leader>tv :vsplit <Bar> terminal<CR>

" easy switching from/into terminal buffers
tnoremap <Esc> <C-\><C-n>
tnoremap <C-w> <C-\><C-n><C-w>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <C-d> <C-\><C-n>:q<CR>

" try to unlearn a nasty habbit
vno d <Nop>
vno y <Nop>
