if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.local/share/nvim/site/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.local/share/nvim/site/autoload/plug.vim
endif

" Plug 'airblade/vim-gitgutter'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'sbdchd/neoformat'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()                             " end plug

let g:mapleader=','                         " set leader

syntax on                                   " enable syntax
filetype plugin on                          "
set bg=light                                "
set backspace=indent,eol,start              " allow backspacing over everything in insert mode
set cmdheight=2                              "
set cursorline                              " enable cursor line
set display=truncate                        "
set encoding=utf8                           " set encoding
set hidden                                  "
set history=200                             "
set hlsearch                                " highlight searched by default
set incsearch                               " find the next match as we type the search
set laststatus=2                            " enable statusline
set linespace=4                             " add some line space for easy reading
set nobackup                                "
set nocompatible                            " use Vim settings, rather than Vi
set noshowcmd                               " show incomplete cmds down the bottom
set noshowmode                              " do not show current mode down the bottom
set nowritebackup                           "
set number relativenumber                   " enable line numbers
set ruler                                   "
set scrolloff=5                             "
set shortmess+=c                            "
set ttimeout                                "
set ttimeoutlen=100                         "
set updatetime=300                          "
set wildmenu                                " enable ctrl-n & ctrl-p to scroll thru matched
set wildmode=longest:list:full              "
" set foldmethod=syntax                       " fold based on syntax
" set foldcolumn=<n>

" indent settings
set shiftwidth=2                            "
set tabstop=2                               "
set expandtab                               "
set autoindent                              "

" fix the vertical split theming
highlight VertSplit ctermbg=black ctermfg=black
highlight SignColumn ctermfg=NONE ctermbg=black cterm=NONE
highlight Pmenu ctermfg=NONE ctermbg=black cterm=NONE
highlight PmenuSel ctermfg=NONE ctermbg=darkblue cterm=NONE

" coc
" use tab for trigger completion with characters ahead and navigate.
" use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" using CocList
" show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

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
let g:hardtime_default_on = 0
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

" ale
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['standard'],
\}
" let g:ale_javascript_standard_options = ' --stdin < %s > '
let g:ale_fix_on_save = 1

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
