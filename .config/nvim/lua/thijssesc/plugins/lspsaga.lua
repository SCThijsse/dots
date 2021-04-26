-- lspsaga

local saga = require('lspsaga')

saga.init_lsp_saga {
    code_action_icon = '',
    definition_preview_icon = '',
    rename_prompt_prefix = '> ',
    finder_action_keys = {
        open = { 'o', '<CR>' },
        vsplit = 's',
        split = 'i',
        quit = { 'q', '<ESC>' },
        scroll_down = '<C-f>',
        scroll_up = '<C-b>',
    },
    rename_action_keys = {
        quit = { 'q', '<C-c>' },
        exec = '<CR>',
    },
}

