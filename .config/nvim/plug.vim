" plug
if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.local/share/nvim/site/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.local/share/nvim/site/autoload/plug.vim
endif

call plug#begin('~/.local/share/nvim/plugged')
" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" misc
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'mcchrish/nnn.vim'
Plug 'ThePrimeagen/vim-be-good'
call plug#end()
