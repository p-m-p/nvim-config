local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  -- Support
  use {
    "nvim-tree/nvim-web-devicons",
  }

  -- Colour theme
  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup {
        flavour = "macchiato" -- mocha, macchiato, frappe, latte
      }
      vim.api.nvim_command "colorscheme catppuccin"
    end
  }

  -- Code completion formatting and linting
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "MunifTanjim/prettier.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    { "L3MON4D3/LuaSnip", tag = "v1.*" },
    "rafamadriz/friendly-snippets",
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
    "tpope/vim-surround",
    "jiangmiao/auto-pairs",
  }

  use {
    "editorconfig/editorconfig-vim",
    setup = function()
      vim.g.EditorConfig_max_line_indicator = "none"
      vim.g.EditorConfig_preserve_formatoptions = 1
    end,
  }

  -- Status bar
  use { "nvim-lualine/lualine.nvim" }

  -- File explorer
  use { "nvim-tree/nvim-tree.lua" }

  -- Search
  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = {
      "nvim-lua/plenary.nvim"
    }
  }
  use { "nvim-telescope/telescope-ui-select.nvim" }

  -- Issues
  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup()
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
