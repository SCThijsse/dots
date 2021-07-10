-- theming

vim.g.material_style = 'deep ocean'
require('material').set()

local async
async = vim.loop.new_async(vim.schedule_wrap(function ()
    local colors = require('material.colors')
    -- general highlighting stuff
    vim.cmd(string.format('highlight CursorLine              guifg=NONE guibg=NONE gui=underline'))
    vim.cmd(string.format('highlight Normal                  guifg=NONE guibg=NONE gui=NONE'))
    vim.cmd(string.format('highlight NormalFloat             guifg=NONE guibg=NONE gui=NONE'))
    vim.cmd(string.format('highlight SignColumn              guifg=%s   guibg=NONE gui=NONE', colors.fg))
    vim.cmd(string.format('highlight Special                 guifg=%s   guibg=NONE gui=NONE', colors.yellow))
    vim.cmd(string.format('highlight String                  guifg=%s   guibg=NONE gui=NONE', colors.green))
    vim.cmd(string.format('highlight QuickFixLine            guifg=%s   guibg=NONE gui=NONE', colors.yellow))

    -- telescope highlighting
    vim.cmd(string.format('highlight TelescopeBorder         guifg=%s   guibg=NONE gui=NONE', colors.red))
    vim.cmd(string.format('highlight TelescopePromptBorder   guifg=%s   guibg=NONE gui=NONE', colors.red))
    vim.cmd(string.format('highlight TelescopeResultsBorder  guifg=%s   guibg=NONE gui=NONE', colors.red))
    vim.cmd(string.format('highlight TelescopePreviewBorder  guifg=%s   guibg=NONE gui=NONE', colors.red))
    vim.cmd(string.format('highlight TelescopeSelectionCaret guifg=%s   guibg=NONE gui=bold', colors.red))
    vim.cmd(string.format('highlight TelescopeSelection      guifg=%s   guibg=NONE gui=bold', colors.red))
    vim.cmd(string.format('highlight TelescopeMultiSelection guifg=%s   guibg=NONE gui=bold', colors.red))
    vim.cmd(string.format('highlight TelescopeMatching       guifg=%s   guibg=NONE gui=bold', colors.green))
    vim.cmd('highlight TelescopeNormal         guifg=NONE guibg=NONE gui=NONE')
    vim.cmd(string.format('highlight TelescopePromptPrefix   guifg=%s   guibg=NONE gui=NONE', colors.red))

    -- lsp cursor hold highlighting
    vim.cmd(string.format('highlight LspReferenceRead        guifg=NONE guibg=NONE gui=bold,underline'))
    vim.cmd(string.format('highlight LspReferenceText        guifg=NONE guibg=NONE gui=bold,underline'))
    vim.cmd(string.format('highlight LspReferenceWrite       guifg=NONE guibg=NONE gui=bold,underline'))

    async:close()
end))
async:send()
