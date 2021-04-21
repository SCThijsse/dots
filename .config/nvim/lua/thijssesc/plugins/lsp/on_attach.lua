-- on_attach

return function(client, bufnr)
    local builtin = require('telescope.builtin')
    local utils = require('thijssesc.utils')

    local opt = utils.opt
    local nnoremap = utils.keymap.nnoremap
    local vnoremap = utils.keymap.vnoremap

    opt('b', 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    nnoremap { 'gD',         vim.lsp.buf.declaration, buffer = bufnr }
    nnoremap { 'gd',         vim.lsp.buf.definition, buffer = bufnr }
    nnoremap { 'K',          vim.lsp.buf.hover, buffer = bufnr }
    nnoremap { 'gi',         vim.lsp.buf.implementation, buffer = bufnr }
    nnoremap { '<A-S-K>',    vim.lsp.buf.signature_help, buffer = bufnr }
    nnoremap { '<leader>wa', vim.lsp.buf.add_workspace_folder, buffer = bufnr }
    nnoremap { '<leader>wr', vim.lsp.buf.remove_workspace_folder, buffer = bufnr }
    nnoremap { '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, buffer = bufnr }
    nnoremap { '<leader>D',  vim.lsp.buf.type_definition, buffer = bufnr }
    nnoremap { '<leader>rn', vim.lsp.buf.rename, buffer = bufnr }
    nnoremap { '<leader>ca', builtin.lsp_code_actions, buffer = bufnr }
    nnoremap { '<A-CR>',     builtin.lsp_code_actions, buffer = bufnr }
    nnoremap { 'gr',         builtin.lsp_references, buffer = bufnr }
    nnoremap { '<leader>e',  vim.lsp.diagnostic.show_line_diagnostics, buffer = bufnr }
    nnoremap { '[d',         function() vim.lsp.diagnostic.goto_next({ enable_popup = false }) end, buffer = bufnr }
    nnoremap { ']d',         function() vim.lsp.diagnostic.goto_prev({ enable_popup = false }) end, buffer = bufnr }
    nnoremap { '<leader>q',  builtin.lsp_document_diagnostics, buffer = bufnr }

    if client.resolved_capabilities.document_formatting then
        nnoremap { '<leader>F', vim.lsp.buf.formatting, buffer = bufnr }
    elseif client.resolved_capabilities.document_range_formatting then
        vnoremap { '<leader>F', vim.lsp.buf.range_formatting, buffer = bufnr }
    end

    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
    end
end
