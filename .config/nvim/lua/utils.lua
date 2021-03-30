-- utils

local scopes = { o = vim.o, b = vim.bo, w = vim.wo }
local maps = { 'inoremap', 'nnoremap', 'snoremap', 'tnoremap', 'vnoremap' }

local M = {}

function M.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then
      scopes['o'][key] = value
  end
end

-- creates a keymap function for each value in the `maps` table with the
-- `silent` option being on by default.
for _, v in ipairs(maps) do
    M.keymap = M.keymap or {}
    M.keymap[v] = function(opts)
        opts = vim.tbl_extend('force', { silent = true }, opts)
        vim.keymap[v](opts)
    end
end

function M.trim_whitespace()
    local save = vim.fn.winsaveview()
    vim.cmd [[keeppatterns %s/\s\+$//e]]
    vim.fn.winrestview(save)
end

return M
