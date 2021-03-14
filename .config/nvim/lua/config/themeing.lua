-- theming

vim.api.nvim_set_option('background', 'light')

-- fix the vertical split theming
vim.cmd [[highlight SignColumn         ctermfg=NONE     ctermbg=black    cterm=NONE]]
vim.cmd [[highlight Pmenu              ctermfg=NONE     ctermbg=black    cterm=NONE]]
vim.cmd [[highlight PmenuSel           ctermfg=NONE     ctermbg=darkblue cterm=NONE]]
vim.cmd [[highlight TelescopeSelection ctermfg=NONE     ctermbg=darkblue cterm=NONE]]
vim.cmd [[highlight VertSplit          ctermfg=black    ctermbg=black    cterm=NONE]]
