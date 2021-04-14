-- on_attach

return function(client, bufnr)
    local code_action = require('lspsaga.codeaction')
    local hover = require('lspsaga.hover')
    local provider = require('lspsaga.provider')
    local rename = require('lspsaga.rename')
    local diagnostic = require('lspsaga.diagnostic')
    local signature_help  = require('lspsaga.signaturehelp')
    local utils = require('thijssesc.utils')

    local opt = utils.opt
    local nnoremap = utils.keymap.nnoremap

    opt('b', 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    nnoremap { '<A-CR>',     code_action.code_action, buffer = bufnr }
    nnoremap { '<leader>ca', vim.lsp.buf.code_action, buffer = bufnr }
    nnoremap { 'gD',         provider.preview_definition, buffer = bufnr }
    nnoremap { 'gd',         vim.lsp.buf.definition, buffer = bufnr }
    nnoremap { '<leader>gd', vim.lsp.buf.declaration, buffer = bufnr }
    nnoremap { 'K',          hover.render_hover_doc, buffer = bufnr }
    nnoremap { 'gi',         vim.lsp.buf.implementation, buffer = bufnr }
    nnoremap { '<A-K>',      signature_help.signature_help, buffer = bufnr }
    nnoremap { '<leader>wa', vim.lsp.buf.add_workspace_folder, buffer = bufnr }
    nnoremap { '<leader>wr', vim.lsp.buf.remove_workspace_folder, buffer = bufnr }
    nnoremap { '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, buffer = bufnr }
    nnoremap { '<leader>D',  vim.lsp.buf.type_definition, buffer = bufnr }
    nnoremap { '<leader>rn', rename.rename, buffer = bufnr }
    nnoremap { 'gr',         provider.lsp_finder, buffer = bufnr }
    nnoremap { '<leader>e',  vim.lsp.diagnostic.show_line_diagnostics, buffer = bufnr }
    nnoremap { '[d',         diagnostic.lsp_jump_diagnostic_prev, buffer = bufnr }
    nnoremap { ']d',         diagnostic.lsp_jump_diagnostic_next, buffer = bufnr }
    nnoremap { '<leader>q',  vim.lsp.diagnostic.set_loclist, buffer = bufnr }

  if client.resolved_capabilities.document_formatting then
      nnoremap { '<leader>F', vim.lsp.buf.formatting, buffer = bufnr }
  elseif client.resolved_capabilities.document_range_formatting then
      nnoremap { '<leader>F', vim.lsp.buf.range_formatting, buffer = bufnr }
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
