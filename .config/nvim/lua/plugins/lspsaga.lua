-- lspsaga

local lspsaga = require('lspsaga')

lspsaga.init_lsp_saga {
    finder_action_keys = {
        open = 'o',
        vsplit = 'v',
        split = 'x',
        quit = { 'q', '<ESC>' },
        scroll_down = '<C-f>',
        scroll_up = '<C-b>',
    },
    code_action_keys = {
        quit = { 'q', '<ESC>' },
        exec = '<CR>',
    },
    rename_action_keys = {
        quit = { '<C-c>', '<ESC>' },
        exec = '<CR>',
    },
}
