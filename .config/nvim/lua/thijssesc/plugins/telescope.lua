-- telescope

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local telescope = require('telescope')
local themes = require('telescope.themes')
local utils = require('thijssesc.utils')

local nnoremap = utils.keymap.nnoremap

telescope.setup {
    defaults = {
        initial_mode = 'insert',
        file_ignore_patterns = { 'target/*', '%.class', '.git' },
        mappings = {
            i = {
                ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
            },
        },
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
    extensions = {
        fzf = {
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = 'smart_case',        -- or "ignore_case" or "respect_case"
        },
    },
}
telescope.load_extension('fzf')

local custom = {}

function custom.buffers()
    builtin.buffers { shorten_path = true }
end

function custom.git_branches()
    local opts = themes.get_dropdown { previewer = false }
    builtin.git_branches(opts)
end

function custom.find_files()
    builtin.find_files {
        find_command = { 'find', '.', '-type', 'f' },
    }
end

function custom.dot_files()
    local opts = themes.get_dropdown {
        previewer = false,
        prompt_title = '~ dotfiles ~',
        cwd = '~/',
    }
    builtin.git_files(opts)
end

nnoremap { '<leader><BS>', builtin.file_browser }
nnoremap { '<leader>fb',   custom.buffers }
nnoremap { '<leader>fB',   custom.git_branches }
nnoremap { '<leader>fC',   builtin.git_bcommits }
nnoremap { '<leader>fc',   builtin.git_commits }
nnoremap { '<leader>fd',   custom.dot_files }
nnoremap { '<leader>ff',   custom.find_files }
nnoremap { '<leader>fg',   builtin.live_grep }
nnoremap { '<leader>fG',   builtin.git_files }
nnoremap { '<leader>fs',   builtin.git_status }
nnoremap { '<leader>fS',   builtin.grep_string }
