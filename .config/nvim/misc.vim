" misc

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THIJSSE
    autocmd!
    " trim whitespaces when writing
    autocmd BufWritePre * :call TrimWhitespace()
    " enter insert mode when opening/switching to a terminal buffer
    autocmd BufWinEnter,TermOpen,WinEnter term://* startinsert
    " enter normal mode when exiting a terminal buffer
    autocmd BufLeave term://* stopinsert
augroup END
