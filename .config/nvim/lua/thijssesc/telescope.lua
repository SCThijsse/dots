--- telescope
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

require('telescope').setup {
  defaults = {
    initial_mode = "normal",
    layout_defaults = {
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5
      }
    }
  }
}

local M = {}

--- begin overwrite pickers
function M.buffers()
  local opts = themes.get_dropdown { previewer = false }
  builtin.buffers(opts)
end

function M.git_branches()
  local opts = themes.get_dropdown { previewer = false }
  builtin.git_branches(opts)
end

function M.find_files()
  builtin.find_files {
    initial_mode = "insert",
    find_command = { 'find', '.', '-type', 'f' }
  }
end

function M.git_files()
  builtin.git_files { initial_mode = "insert" }
end

function M.live_grep()
  builtin.live_grep { initial_mode = "insert" }
end
--- end overwrite default pickers

--- begin custom pickers
function M.dot_files()
  local opts = themes.get_dropdown {
    previewer = false,
    prompt_title = "~ dotfiles ~",
    cwd = "~/"
  }
  builtin.git_files(opts)
end
--- end custom pickers

return M
