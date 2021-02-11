" nnn
let g:nnn#set_default_mappings = 0
let g:nnn#command = 'nnn -Hd'
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#action = {
    \ '<c-x>': 'split',
    \ '<c-v>': 'vsplit' }

nnoremap <silent> <leader>nn :NnnPicker %:p:h<CR>
