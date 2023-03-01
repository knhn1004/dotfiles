vim.cmd [[packadd packer.nvim]]

-- Load plugins
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'lambdalisue/fern.vim'
  use 'morhetz/gruvbox'
  use 'tpope/vim-commentary'
  use 'SirVer/ultisnips'
  -- use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

end)
