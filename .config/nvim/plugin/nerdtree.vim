" nerdtree
nnoremap <silent> <leader><BS> :NERDTreeToggle<CR>

" exit vim if NERDTree is the only window left.
autocmd BufEnter * nested if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
