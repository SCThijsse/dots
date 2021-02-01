" telescope
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fg :Telescope live_grep<cr>
nnoremap <leader>gf :Telescope git_files<cr>

nnoremap <leader>tb  :Telescope git_branches<cr>
nnoremap <leader>tc  :Telescope git_commits<cr>
nnoremap <leader>tbc :Telescope git_bcommits<cr>
nnoremap <leader>ts  :Telescope git_status<cr>

lua require'telescope'.setup{ defaults = { initial_mode = "normal" } }
