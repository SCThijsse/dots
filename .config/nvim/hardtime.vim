" hardtime

let g:hardtime_default_on = 1
let g:hardtime_maxcount = 2

let g:list_of_normal_keys = ["w", "b", "h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["w", "b", "h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []

nnoremap <leader>ht :HardTimeToggle<CR>
