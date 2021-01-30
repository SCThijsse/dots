" keymaps

let mapleader = " "                         " set leader

" apparently great remaps
vnoremap <leader>p "_dP
nnoremap <leader>y "+y
vnoremap <leader>y "+Y
nnoremap <leader>Y gg"+yG

" unmap arrow keys
no  <down>  ddp
no  <left>  <Nop>
no  <right> <Nop>
no  <up>    ddkP
" disabled for autocompletion
" ino <down>  <Nop>
" ino <left>  <Nop>
" ino <right> <Nop>
" ino <up>    <Nop>
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

" utils
vnoremap < <gv
vnoremap > >gv

" spell-checking
map <leader>oe :setlocal spell! spelllang=en_us<CR>
map <leader>on :setlocal spell! spelllang=nl_nl<CR>

" switch buffers
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>H :wincmd H<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>J :wincmd J<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>K :wincmd K<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>L :wincmd L<CR>

" resize buffers
nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>+ :resize +5<CR>
nnoremap <leader>_ :resize -5<CR>

" terminals
nnoremap <leader>st  :split <Bar> resize 15 <Bar> terminal<CR>
nnoremap <leader>vst :vsplit <Bar> terminal<CR>

