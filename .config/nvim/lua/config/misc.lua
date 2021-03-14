-- misc
function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command('augroup '..group_name)
        vim.api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command('augroup END')
    end
end

nvim_create_augroups {
    whitespaces = {
        -- trim whitespaces when writing
        { 'BufWritePre', '*', [[:lua require('thijssesc.misc').trim_whitespace()]] }
    },
    term = {
        -- enter insert mode when opening/switching to a terminal buffer
        { 'BufWinEnter,TermOpen,WinEnter', 'term://*', 'startinsert' },
        -- enter normal mode when exiting a terminal buffer
	{ 'BufLeave',                      'term://*', 'stopinsert' }
    },
    presentation_mode = {
        -- presentation mode for .vpm files
        { 'BufNewFIle,BufRead', '*.vpm', [[:lua require('thijssesc.misc').presentation_mode()]] }
    },
    nerdtree = {
        -- exit vim if NERDTree is the only window left.
        { 'BufEnter', '*', [[nested if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif]] }
    }
}
