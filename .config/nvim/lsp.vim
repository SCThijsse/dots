" lsp
filetype plugin on

set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,noinsert,noselect

nnoremap <leader>gi  :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gd  :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gh  :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gr  :lua vim.lsp.buf.references()<CR>
nnoremap <leader>grn :lua vim.lsp.buf.rename()<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }

