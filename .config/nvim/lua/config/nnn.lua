-- nnn

vim.g['nnn#command'] = 'nnn -CHde'                    
vim.g['nnn#set_default_mappings']= 0
vim.g['nnn#layout'] = {
    window = {
        width = 0.9,
        height = 0.6,
        highlight = 'Debug'
    }
}
vim.g['nnn#action'] = {
     ['<c-x>'] = 'split',
     ['<c-v>'] = 'vsplit'
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>nn', [[:NnnPicker %:p:h<CR>]], opts)
