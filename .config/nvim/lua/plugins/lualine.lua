-- lualine

local colorbuddy = require('colorbuddy')
local lualine = require('lualine')

local Color, colors = colorbuddy.setup {}
local deep_ocean = {}

local colors_rgb = {
    white          = Color.to_rgb(colors.white),
    bg             = Color.to_rgb(colors.bg),
    green          = Color.to_rgb(colors.green),
    cyan           = Color.to_rgb(colors.cyan),
    blue           = Color.to_rgb(colors.blue),
    red            = Color.to_rgb(colors.red),
    orange         = Color.to_rgb(colors.orange),
    line_highlight = Color.to_rgb(colors.line_highlight),
    selection      = Color.to_rgb(colors.selection),
    line_numbers   = Color.to_rgb(colors.line_numbers),
    fg1            = Color.to_rgb(colors.fg1),
    accent         = Color.to_rgb(colors.accent),
}

deep_ocean.normal = {
    a = { fg = colors_rgb.line_highlight, bg = colors_rgb.green, gui = 'bold' },
    b = { fg = colors_rgb.accent,         bg = colors_rgb.line_numbers },
    c = { fg = colors_rgb.fg1,            bg = colors_rgb.selection },
}

deep_ocean.insert = {
    a = { fg = colors_rgb.line_highlight, bg = colors_rgb.white, gui = 'bold' },
    b = { fg = colors_rgb.line_numbers,   bg = colors_rgb.cyan },
    c = { fg = colors_rgb.white,          bg = colors_rgb.blue },
}

deep_ocean.visual = {
    a = { fg = colors_rgb.line_highlight, bg = colors_rgb.orange, gui = 'bold' },
}

deep_ocean.replace = {
    a = { fg = colors_rgb.white,          bg = colors_rgb.red, gui = 'bold' },
}

deep_ocean.inactive = {
    a = { fg = colors_rgb.line_highlight, bg = colors_rgb.line_numbers, gui = 'bold' },
    b = { fg = colors_rgb.line_highlight, bg = colors_rgb.line_numbers },
    c = { fg = colors_rgb.line_numbers,   bg = colors_rgb.line_highlight },
}

lualine.setup {
    options = {
        theme = deep_ocean,
        icons_enabled = false,
        section_separators = { nil, nil },
        component_separators = { nil, nil },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
            'filename',
            { 'diagnostics', sources = { 'nvim_lsp' } },
        },
        lualine_x = {
            'encoding',
            'fileformat',
            'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
    }
}
