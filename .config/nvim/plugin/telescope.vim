" telescope
lua require('thijssesc.telescope')

nnoremap <silent> <leader>fc :lua require('telescope.builtin').git_commits()<CR>
nnoremap <silent> <leader>fo :lua require('telescope.builtin').git_bcommits()<CR>
nnoremap <silent> <leader>fs :lua require('telescope.builtin').git_status()<CR>

nnoremap <silent> <leader>fb :lua require('thijssesc.telescope').git_branches()<CR>
nnoremap <silent> <leader>fd :lua require('thijssesc.telescope').dot_files()<CR>
nnoremap <silent> <leader>ff :lua require('thijssesc.telescope').find_files()<CR>
nnoremap <silent> <leader>fg :lua require('thijssesc.telescope').live_grep()<CR>
nnoremap <silent> <leader>fr :lua require('thijssesc.telescope').git_files()<CR>
nnoremap <silent> <leader>fu :lua require('thijssesc.telescope').buffers()<CR>
