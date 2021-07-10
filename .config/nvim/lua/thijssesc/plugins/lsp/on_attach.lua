-- on_attach

return function(client, buffer)
    local utils = require('thijssesc.utils')
    local custom = require('thijssesc.plugins.telescope')

    local nnoremap = utils.keymap.nnoremap
    local vnoremap = utils.keymap.vnoremap

    -- vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

    nnoremap { 'gD',         vim.lsp.buf.declaration, buffer = buffer }
    nnoremap { 'gd',         vim.lsp.buf.definition, buffer = buffer }
    nnoremap { 'K',          vim.lsp.buf.hover, buffer = buffer }
    nnoremap { 'gi',         vim.lsp.buf.implementation, buffer = buffer }
    nnoremap { '<A-S-K>',    vim.lsp.buf.signature_help, buffer = buffer }
    nnoremap { '<leader>wa', vim.lsp.buf.add_workspace_folder, buffer = buffer }
    nnoremap { '<leader>wr', vim.lsp.buf.remove_workspace_folder, buffer = buffer }
    nnoremap { '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, buffer = buffer }
    nnoremap { '<leader>D',  vim.lsp.buf.type_definition, buffer = buffer }
    nnoremap { '<leader>rn', vim.lsp.buf.rename, buffer = buffer }
    nnoremap { '<leader>ca', custom.lsp_code_actions, buffer = buffer }
    nnoremap { '<A-CR>',     custom.lsp_code_actions, buffer = buffer }
    nnoremap { 'gr',         custom.lsp_references, buffer = buffer }
    nnoremap { '<leader>e',  vim.lsp.diagnostic.show_line_diagnostics, buffer = buffer }
    nnoremap { '[d',         function() vim.lsp.diagnostic.goto_next({ enable_popup = false }) end, buffer = buffer }
    nnoremap { ']d',         function() vim.lsp.diagnostic.goto_prev({ enable_popup = false }) end, buffer = buffer }
    nnoremap { '<leader>q',  custom.lsp_document_diagnostics, buffer = buffer }
    nnoremap { '<leader>Q',  custom.lsp_workspace_diagnostics, buffer = buffer }

    if client.resolved_capabilities.document_formatting then
        nnoremap { '<leader>F', vim.lsp.buf.formatting, buffer = buffer }
    elseif client.resolved_capabilities.document_range_formatting then
        vnoremap { '<leader>F', vim.lsp.buf.range_formatting, buffer = buffer }
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
