" plug
call plug#begin('~/.config/nvim/plugged')
" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" learning
Plug 'ThePrimeagen/vim-be-good'
Plug 'takac/vim-hardtime'

" misc
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'mcchrish/nnn.vim'
Plug 'preservim/nerdtree'
Plug 'psliwka/vim-smoothie'
Plug 'ThePrimeagen/harpoon'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()

let g:mapleader = ' '
