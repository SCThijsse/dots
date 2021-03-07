" harpoon
lua require('thijssesc.harpoon')

nnoremap <silent> <C-m> :lua require('harpoon.mark').add_file()<CR>
nnoremap <silent> <C-p> :lua require('harpoon.mark').promote()<CR>
nnoremap <silent> <C-s> :lua require('harpoon.mark').shorten_list()<CR>
nnoremap <silent> <C-t> :lua require('harpoon.ui').toggle_quick_menu()<CR>
nnoremap <silent> <C-w> :lua require('harpoon.mark').rm_file()<CR>

nnoremap <silent> <leader>tt :lua require('harpoon.term').gotoTerminal(1)<CR>
nnoremap <silent> <leader>hh :lua require('harpoon.ui').nav_file(1)<CR>
nnoremap <silent> <leader>jj :lua require('harpoon.ui').nav_file(2)<CR>
nnoremap <silent> <leader>kk :lua require('harpoon.ui').nav_file(3)<CR>
nnoremap <silent> <leader>ll :lua require('harpoon.ui').nav_file(4)<CR>
