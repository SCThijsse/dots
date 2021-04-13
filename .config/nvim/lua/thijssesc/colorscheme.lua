-- theming

local colorbuddy = require('colorbuddy')
local utils = require('thijssesc.utils')

local _, colors, Group, _, styles = colorbuddy.setup {}
local opt = utils.opt

vim.g.material_style = 'deep ocean'
colorbuddy.colorscheme('material')

opt('o', 'termguicolors', true)

-- general highlighting stuff
Group.new('Normal',                 colors.none,   colors.none, styles.none)
Group.new('String',                 colors.green,  colors.none, styles.none)
Group.new('Special',                colors.yellow, colors.none, styles.none)
Group.new('CursorLine',             colors.none,   colors.none, styles.underline)

-- telescope highlighting
Group.new('TelescopeSelection',     colors.red,    colors.none, styles.bold)
Group.new('TelescopeBorder',        colors.red,    colors.none, styles.none)
Group.new('TelescopePromptBorder',  colors.red,    colors.none, styles.none)
Group.new('TelescopeResultsBorder', colors.red,    colors.none, styles.none)
Group.new('TelescopePreviewBorder', colors.red,    colors.none, styles.none)
Group.new('TelescopeMatching',      colors.green,  colors.none, styles.bold)
Group.new('TelescopePromptPrefix',  colors.red,    colors.none, styles.none)

-- lsp cursor hold highlighting
Group.new('LspReferenceRead',       colors.none,   colors.none,  styles.bold + styles.underline)
Group.new('LspReferenceText',       colors.none,   colors.none,  styles.bold + styles.underline)
Group.new('LspReferenceWrite',      colors.none,   colors.none,  styles.bold + styles.underline)
