-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Theme
  -- use({ 'folke/tokyonight.nvim' })
  -- vim.cmd('colorscheme tokyonight-night')
  -- use 'rebelot/kanagawa.nvim'
  -- use 'ellisonleao/gruvbox.nvim'
  -- vim.o.background = "light" -- or "light" for light mode
  -- vim.cmd([[colorscheme gruvbox]])
  -- use { "catppuccin/nvim", as = "catppuccin" }
  use { 
    "ellisonleao/gruvbox.nvim",
    opts = {
      contrast = "soft",
      italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false 
      }
    }
  }
  vim.o.background = "dark"
  vim.cmd([[colorscheme gruvbox]])

  use 'nvim-lualine/lualine.nvim'

  use('nvim-orgmode/orgmode')
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('akinsho/toggleterm.nvim')
  use('jose-elias-alvarez/null-ls.nvim')
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = function()
      local copilot = require("copilot")
      copilot.setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          ["*"] = true,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })
    end,

    event = "InsertEnter",
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
end)
