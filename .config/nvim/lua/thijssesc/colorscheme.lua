-- theming

local material = require('material')
material.load { style = 'deep ocean' }

local colors = require('material.colors')

-- general highlighting stuff
vim.cmd(string.format('highlight CursorLine             guifg=NONE guibg=NONE gui=underline'))
vim.cmd(string.format('highlight Normal                 guifg=NONE guibg=NONE gui=NONE'))
vim.cmd(string.format('highlight NormalFloat            guifg=NONE guibg=NONE gui=NONE'))
vim.cmd(string.format('highlight SignColumn             guifg=%s   guibg=NONE gui=NONE', colors.fg))
vim.cmd(string.format('highlight Special                guifg=%s   guibg=NONE gui=NONE', colors.yellow))
vim.cmd(string.format('highlight String                 guifg=%s   guibg=NONE gui=NONE', colors.green))

-- telescope highlighting
vim.cmd(string.format('highlight TelescopeSelection     guifg=%s   guibg=NONE gui=bold', colors.red))
vim.cmd(string.format('highlight TelescopeBorder        guifg=%s   guibg=NONE gui=NONE', colors.red))
vim.cmd(string.format('highlight TelescopePromptBorder  guifg=%s   guibg=NONE gui=NONE', colors.red))
vim.cmd(string.format('highlight TelescopeResultsBorder guifg=%s   guibg=NONE gui=NONE', colors.red))
vim.cmd(string.format('highlight TelescopePreviewBorder guifg=%s   guibg=NONE gui=NONE', colors.red))
vim.cmd(string.format('highlight TelescopeMatching      guifg=%s   guibg=NONE gui=bold', colors.green))
vim.cmd(string.format('highlight TelescopePromptPrefix  guifg=%s   guibg=NONE gui=NONE', colors.red))

-- lsp cursor hold highlighting
vim.cmd(string.format('highlight LspReferenceRead       guifg=NONE guibg=NONE gui=bold,underline'))
vim.cmd(string.format('highlight LspReferenceText       guifg=NONE guibg=NONE gui=bold,underline'))
vim.cmd(string.format('highlight LspReferenceWrite      guifg=NONE guibg=NONE gui=bold,underline'))

