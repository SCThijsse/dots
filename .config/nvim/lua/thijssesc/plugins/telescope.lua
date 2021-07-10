-- telescope

local actions = require('telescope.actions')
local previewers = require('telescope.previewers')
local sorters = require('telescope.sorters')
local builtin = require('telescope.builtin')
local telescope = require('telescope')
local themes = require('telescope.themes')
local utils = require('thijssesc.utils')

local nnoremap = utils.keymap.nnoremap

telescope.setup {
    defaults = {
        prompt_prefix = '> ',
        selection_caret = '> ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'descending',
        layout_strategy = 'horizontal',
        layout_config = {
            prompt_position = 'bottom',
            width = 0.75,
            preview_cutoff = 120,
            -- results_height = 1,
            -- results_width = 0.8,
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
        file_sorter =  sorters.get_fuzzy_file,
        file_ignore_patterns = { '%.class', '.git/*', 'parser.c', 'target/*', 'node_modules/*' },
        generic_sorter =  sorters.get_generic_fuzzy_sorter,
        -- shorten_path = true,
        path_display = { 'shorten' },
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = false,
        use_less = true,
        set_env = nil,
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        mappings = {
            i = {
                ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
            },
        },
    },
    extensions = {
        fzf = {
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
    },
}
telescope.load_extension('dap')
telescope.load_extension('fzf')

local custom = {}

function custom.dap_commands()
    local opts = themes.get_dropdown()
    telescope.extensions.dap.commands(opts)
end

function custom.dot_files()
    local opts = themes.get_dropdown {
        cwd = '~/',
        previewer = false,
        prompt_title = '~ dotfiles ~',
    }
    builtin.git_files(opts)
end

function custom.find_files()
    builtin.find_files {
        find_command = { 'find', '.', '-type', 'f' },
        shorten_path = true,
    }
end

function custom.git_branches()
    local opts = themes.get_dropdown {
        previewer = false,
        shorten_path = false,
        width = 120,
    }
    builtin.git_branches(opts)
end

function custom.lsp_code_actions()
    local opts = themes.get_dropdown { width = 120 }
    builtin.lsp_code_actions(opts)
end

function custom.lsp_references()
    local opts = themes.get_dropdown { width = 120 }
    builtin.lsp_references(opts)
end

function custom.lsp_document_diagnostics()
    local opts = themes.get_dropdown { width = 120 }
    builtin.lsp_document_diagnostics(opts)
end

function custom.lsp_workspace_diagnostics()
    local opts = themes.get_dropdown { width = 120 }
    builtin.lsp_workspace_diagnostics(opts)
end

nnoremap { '<leader><BS>', builtin.file_browser }
nnoremap { '<leader>fb',   builtin.buffers }
nnoremap { '<leader>fB',   custom.git_branches }
nnoremap { '<leader>fC',   builtin.git_bcommits }
nnoremap { '<leader>fc',   builtin.git_commits }
nnoremap { '<leader>fd',   custom.dot_files }
nnoremap { '<leader>ff',   custom.find_files }
nnoremap { '<leader>fg',   builtin.live_grep }
nnoremap { '<leader>fG',   builtin.git_files }
nnoremap { '<leader>fs',   builtin.git_status }
nnoremap { '<leader>fS',   builtin.grep_string }

nnoremap { '<leader><leader>c', custom.dap_commands }
nnoremap { '<leader><leader>C', telescope.extensions.dap.configurations }
nnoremap { '<leader><leader>f', telescope.extensions.dap.frames }
nnoremap { '<leader><leader>l', telescope.extensions.dap.list_breakpoints }
nnoremap { '<leader><leader>v', telescope.extensions.dap.variables }

return custom
