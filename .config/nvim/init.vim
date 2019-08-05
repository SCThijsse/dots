if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.local/share/nvim/site/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.local/share/nvim/site/autoload/plug.vim
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'udalov/kotlin-vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'sbdchd/neoformat'
call plug#end()                             " end plug

let g:mapleader=','                         " set leader

syntax on                                   " enable syntax
filetype plugin on                          "
set bg=light                                "
set backspace=indent,eol,start              " allow backspacing over everything in insert mode
set cursorline                              " enable cursor line
set display=truncate                        "
set encoding=utf8                           " set encoding
set history=200                             "
set hlsearch                                " highlight searched by default
set incsearch                               " find the next match as we type the search
set laststatus=2                            " enable statusline
set linespace=4                             " add some line space for easy reading
set nocompatible                            " use Vim settings, rather than Vi
set noshowcmd                               " show incomplete cmds down the bottom
set noshowmode                              " do not show current mode down the bottom
set number relativenumber                   " enable line numbers
set ruler                                   "
set scrolloff=5                             "
set ttimeout                                "
set ttimeoutlen=100                         "
set wildmenu                                " enable ctrl-n & ctrl-p to scroll thru matched
set wildmode=longest:list:full              "

" indent settings
set shiftwidth=2                            "
set tabstop=2                               "
set expandtab                               "
set autoindent                              "

" Fix the vertical split theming
highlight VertSplit ctermbg=Black ctermfg=Black

" gitgutter
set updatetime=100
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutterhighlight_lines = 1

" goyo
map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
let g:goyo_width = 95
let g:goyo_height = 90

" hardtime
map <leader>h :HardTimeToggle<CR>
let g:hardtime_default_on = 1
let g:hardtime_timeout = 2000
let g:hardtime_showmsg = 1
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 2

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" mutiple cursors
let g:multi_cursor_select_all_word_key = '<C-N>'

" nerdtree
map <leader>\ :NERDTreeToggle<CR>

" unmap arrow keys
no  <down>  ddp
no  <left>  <Nop>
no  <right> <Nop>
no  <up>    ddkP
ino <down>  <Nop>
ino <left>  <Nop>
ino <right> <Nop>
ino <up>    <Nop>
vno <down>  <Nop>
vno <left>  <Nop>
vno <right> <Nop>
vno <up>    <Nop>

" auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap { {zz
nmap } }zz

" utils
vmap < <gv
vmap > >gv
vnoremap y "*y<CR>
vnoremap Y "*Y<CR>

" quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

" spell-checking
map <leader>oe :setlocal spell! spelllang=en_us<CR>
map <leader>on :setlocal spell! spelllang=nl_nl<CR>
