" lsp
filetype plugin on

set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,noinsert,noselect

nnoremap <silent> <leader>dd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>de :lue vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>df :lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>dh :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>di :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>dr :lua vim.lsp.buf.rename()<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>"   : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>"   : "\<S-Tab>"

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require('lspconfig').tsserver.setup { on_attach = require('completion').on_attach }

