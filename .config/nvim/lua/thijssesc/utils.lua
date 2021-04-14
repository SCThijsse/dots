-- utils

local reload = require('plenary.reload')

require('astronauta.keymap')

local scopes = { o = vim.o, b = vim.bo, w = vim.wo }
local maps = { 'inoremap', 'nnoremap', 'noremap', 'snoremap', 'tnoremap', 'xnoremap', 'vnoremap' }

local utils = {}

function utils.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then
      scopes['o'][key] = value
  end
end

-- creates a keymap function for each value in the `maps` table with the
-- `silent` option being on by default.
for _, v in ipairs(maps) do
    utils.keymap = utils.keymap or {}
    utils.keymap[v] = function(opts)
        opts = vim.tbl_extend('force', { silent = true }, opts)
        vim.keymap[v](opts)
    end
end

function utils.trim_whitespace()
    if vim.bo.filetype == 'java' then
        return
    end

    local save = vim.fn.winsaveview()
    vim.cmd [[keeppatterns %s/\s\+$//e]]
    vim.fn.winrestview(save)
end

function utils.nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command('augroup '..group_name)
        vim.api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command('augroup END')
    end
end

function utils.reload()
    for k in pairs(package.loaded) do
        if string.match(k, '^thijssesc') then
            reload.reload_module(k)
            require(k)
        end
    end
end

return utils
