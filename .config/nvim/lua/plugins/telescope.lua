-- telescope

local builtin = require('telescope.builtin')
local telescope = require('telescope')
local themes = require('telescope.themes')
local utils = require('utils')

local nnoremap = utils.keymap.nnoremap

telescope.setup {
  defaults = {
    initial_mode = 'normal',
    layout_defaults = {
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      },
    },
  },
}

local custom = {}

--- begin overwrite pickers
function custom.buffers()
  local opts = themes.get_dropdown { previewer = false }
  builtin.buffers(opts)
end

function custom.git_branches()
  local opts = themes.get_dropdown { previewer = false }
  builtin.git_branches(opts)
end

function custom.find_files()
  builtin.find_files {
    initial_mode = 'insert',
    find_command = { 'find', '.', '-type', 'f' },
  }
end

function custom.git_files()
  builtin.git_files { initial_mode = 'insert' }
end

function custom.live_grep()
  builtin.live_grep { initial_mode = 'insert' }
end
--- end overwrite default pickers

--- begin custom pickers
function custom.dot_files()
  local opts = themes.get_dropdown {
    previewer = false,
    prompt_title = '~ dotfiles ~',
    cwd = '~/',
  }
  builtin.git_files(opts)
end
--- end custom pickers

nnoremap { '<leader>fB', custom.buffers }
nnoremap { '<leader>fb', custom.git_branches }
nnoremap { '<leader>fC', builtin.git_bcommits }
nnoremap { '<leader>fc', builtin.git_commits }
nnoremap { '<leader>fd', custom.dot_files }
nnoremap { '<leader>ff', custom.find_files }
nnoremap { '<leader>fg', custom.live_grep }
nnoremap { '<leader>fG', custom.git_files }
nnoremap { '<leader>fs', builtin.git_status }

