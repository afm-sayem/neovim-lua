-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme


local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
return packer.startup(function()
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- file explorer
  use 'kyazdani42/nvim-tree.lua'

  -- indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  -- surround
  -- use {
  --   "blackCauldron7/surround.nvim",
  --   config = function()
  --     require('surround').setup {mappings_style = "surround"}
  --   end
  -- }
  use {
    "tpope/vim-surround"
  }

  -- buffer management
  use {
    "jeetsukumaran/vim-buffergator"
  }

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- tagviewer
  --  use 'liuchengxu/vista.vim'

  -- treesitter interface
  use 'nvim-treesitter/nvim-treesitter'

  -- colorschemes
  use 'tanvirtin/monokai.nvim'
  use 'sainnhe/sonokai'
  use { 'rose-pine/neovim', as = 'rose-pine' }

  -- comment
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- bufferline
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  -- git labels
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- dashboard
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
end)
