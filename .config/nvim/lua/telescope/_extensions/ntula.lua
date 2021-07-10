local has_telescope, telescope = pcall(require, 'telescope')
if not has_telescope then
    error('This plugin requires nvim-telescope/telescope.nvim')
end

local actions = require('telescope.actions')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')

local function select_method(opts, methods)
    pickers.new(opts, {

    }):find()
end

local function method(opts)
    opts = opts or {}

    local methods = ntula_utils.get_methods()



end
