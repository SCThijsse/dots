-- misc

local utils = require('thijssesc.utils')

local nvim_create_augroups = utils.nvim_create_augroups

nvim_create_augroups {
    whitespaces = {
        -- trim whitespaces when writing
        { 'BufWritePre', '*', [[:lua require('thijssesc.utils').trim_whitespace()]] },
    },
    netrw = {
        -- remove the <C-l> mapping when in netrw
        { 'FileType', 'netrw', [[:lua require('thijssesc.utils').remove_netrw_mappings()]] },
    },
    -- turned off for harpoon/ntula
    -- term = {
    --     -- enter insert mode when opening/switching to a terminal buffer
    --     { 'BufWinEnter,TermOpen,WinEnter', 'term://*', 'startinsert' },
    --     -- enter normal mode when exiting a terminal buffer
    --     { 'BufLeave',                      'term://*', 'stopinsert' },
    -- },
    java = {
        -- setup java lsp when entering a java file
        { 'FileType', 'java', [[:lua require('thijssesc.plugins.lsp.java').setup()]] },
    },
}
