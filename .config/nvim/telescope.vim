" telescope
nnoremap <silent> <leader>fb :Telescope git_branches<CR>
nnoremap <silent> <leader>fc :Telescope git_commits<CR>
nnoremap <silent> <leader>ff :Telescope find_files<CR>
nnoremap <silent> <leader>fg :Telescope live_grep<CR>
nnoremap <silent> <leader>fo :Telescope git_bcommits<CR>
nnoremap <silent> <leader>fr :Telescope git_files<CR>
nnoremap <silent> <leader>fs :Telescope git_status<CR>
nnoremap <silent> <leader>fu :Telescope buffers<CR>

lua require'telescope'.setup{ defaults = { initial_mode = "normal" } }
