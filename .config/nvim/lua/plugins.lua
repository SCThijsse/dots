-- packer

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/'
if vim.fn.empty(vim.fn.glob(install_path..'packer.nvim')) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  vim.api.nvim_command('packadd packer.nvim')
end

local packer = require('packer')

return packer.startup(function(use)
    use { 'wbthomason/packer.nvim' }

    -- lsp
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/nvim-compe' }
    use { 'glepnir/lspsaga.nvim', require = { 'neovim/nvim-lspconfig' } }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
    }

    -- lua
    use { 'b3nj5m1n/kommentary' }
    use { 'hoob3rt/lualine.nvim' }
    use { 'kyazdani42/nvim-tree.lua' }
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'mfussenegger/nvim-dap' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'ThePrimeagen/harpoon' }
    use { 'TimUntersberger/neogit', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'tjdevries/astronauta.nvim' }
    use { 'mfussenegger/nvim-jdtls' }
    use { 'norcalli/nvim-colorizer.lua' }

    -- misc
    use { 'psliwka/vim-smoothie' }
    use { 'takac/vim-hardtime' }

    -- colorscheme
    use { 'marko-cerovac/material.nvim', requires = { 'tjdevries/colorbuddy.nvim' } }
end)
