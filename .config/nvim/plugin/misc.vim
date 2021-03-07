" misc

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

fun! PresentationMode()
  " jump to slides
  noremap <silent> <A-Left>  :bnext<CR> :redraw!<CR>
  noremap <silent> <A-Right> :bprev<CR> :redraw!<CR>

  " goyo lite mode
  set norelativenumber
  set nonumber
  set nocursorline
  set noshowcmd
  set noshowmode
  set noruler
  set laststatus=0
  set cmdheight=1

  " hides ~ at the end of the buffer
  " hi! EndOfBuffer ctermbg=black ctermfg=black guibg=black guifg=black

  " disable gitgutter if installed
  if !exists('#gitgutter')
      silent! GitGutterDisable
  endif
endfun

augroup THIJSSE
    autocmd!
    " trim whitespaces when writing
    autocmd BufWritePre * :call TrimWhitespace()
    " enter insert mode when opening/switching to a terminal buffer
    autocmd BufWinEnter,TermOpen,WinEnter term://* startinsert
    " enter normal mode when exiting a terminal buffer
    autocmd BufLeave term://* stopinsert
    " presentation mode
    autocmd BufNewFile,BufRead *.vpm call PresentationMode()
augroup END
