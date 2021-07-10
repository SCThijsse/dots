-- treesitter

local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
  	ensure_installed = 'maintained',
    highlight = { enable = true },
    context_commentstring = { enable = true },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ['ic'] = '@conditional.inner',
                ['ac'] = '@conditional.outer',
                ['aC'] = '@class.outer',
                ['iC'] = '@class.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['il'] = '@loop.inner',
                ['al'] = '@loop.outer',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader>sc'] = '@conditional.outer',
                ['<leader>sf'] = '@function.outer',
                ['<leader>sl'] = '@loop.outer',
                ['<leader>sp'] = '@parameter.inner',
            },
            swap_previous = {
                ['<leader>sC'] = '@conditional.outer',
                ['<leader>sF'] = '@function.outer',
                ['<leader>sL'] = '@loop.outer',
                ['<leader>sP'] = '@parameter.inner',
            },
        },
        lsp_interop = {
            enable = true,
            peek_definition_code = {
                -- ["df"] = "@function.outer",
                -- ["dC"] = "@class.outer",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                [']m'] = '@function.outer',
                -- [']l'] = '@class.outer',
            },
            goto_next_end = {
                -- [']M'] = '@function.outer',
                -- [']L'] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                -- ['[l'] = '@class.outer',
            },
            goto_previous_end = {
                -- ['[M'] = '@function.outer',
                -- ['[L'] = '@class.outer',
            },
        },
    },
}

