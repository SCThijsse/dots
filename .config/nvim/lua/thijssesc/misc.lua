-- misc
local M = {}

function M.trim_whitespace()
    local save = vim.fn.winsaveview()
    vim.cmd [[keeppatterns %s/\s\+$//e]]
    vim.fn.winrestview(save)
end

function M.presentation_mode()
  -- jump to slides
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap('n', '<A-Left>', [[:bnext<CR> :redeaw!<CR>]], opts)
  vim.api.nvim_set_keymap('n', '<A-Right>', [[:bprev<CR> :redeaw!<CR>]], opts)

  -- goyo lite mode
  vim.api.nvim_win_set_option(0, 'relativenumber', false)
  vim.api.nvim_win_set_option(0, 'number', false)
  vim.api.nvim_win_set_option('cursorline', false)
  vim.api.nvim_set_option('showcmd', false)
  vim.api.nvim_set_option('showmode', false)
  vim.api.nvim_set_option('ruler', false)
  vim.api.nvim_set_option('laststatus', 0)
  vim.api.nvim_set_option('cmdheight', 1)

  -- hides ~ at the end of the buffer
  -- vim.cmd [[hi! EndOfBuffer ctermbg=black ctermfg=black guibg=black guifg=black]]

  -- disable gitgutter if installed
  if not vim.fn['#gitgutter'] then
      vim.cmd [[silent! GitGutterDisable]]
  end
end

return M
