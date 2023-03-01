vim.cmd [[packadd packer.nvim]]

-- Load plugins
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  -- use 'lambdalisue/fern.vim'
  -- use 'morhetz/gruvbox'
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      require("rose-pine").setup()
      vim.cmd('colorscheme rose-pine')
    end
  })

  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('nvim-treesitter/playground')

  use 'tpope/vim-commentary'
  use 'SirVer/ultisnips'
  -- use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ('ThePrimeagen/harpoon')
  use ('mbbill/undotree')


end)

