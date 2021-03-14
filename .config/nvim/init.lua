vim.g.mapleader = ' '

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.api.nvim_command 'packadd packer.nvim'
end

require('plugins')
require('config')


local neogit = require('neogit')
neogit.status.create('floating')
