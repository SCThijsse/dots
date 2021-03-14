-- packer
vim.cmd [[packadd packer.nvim]]

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.api.nvim_command 'packadd packer.nvim'
end

return require('packer').startup(function()
    -- lsp
    use { 'neovim/nvim-lspconfig' }
    use { 'nvim-lua/completion-nvim' }
     
    -- telescope
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope.nvim' }
    
    -- learning
    use { 'ThePrimeagen/vim-be-good' }
    use { 'takac/vim-hardtime' }
    
    -- misc
    use { 'airblade/vim-gitgutter' }
    use { 'itchyny/lightline.vim' }
    use { 'mcchrish/nnn.vim' }
    use { 'preservim/nerdtree' }
    use { 'psliwka/vim-smoothie' }
    use { 'ThePrimeagen/harpoon' }
    use { 'tpope/vim-commentary' }
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-surround' }
end)
