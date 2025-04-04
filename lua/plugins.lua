local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- Support
  use "nvim-tree/nvim-web-devicons"

  -- Theme
  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup {
        flavour = "mocha", -- mocha, macchiato, frappe, latte
      }
      vim.api.nvim_command "colorscheme catppuccin"
    end,
  }

  -- Editor
  use {
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-tree.lua",
  }

  -- LSP
  use {
    { "williamboman/mason.nvim", run = ":MasonUpdate" },
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "nvimtools/none-ls.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
    "b0o/SchemaStore.nvim",
    "mfussenegger/nvim-jdtls",
  }

  -- Code formatting
  use {
    "tpope/vim-surround",
    "tpope/vim-sleuth",
    "jiangmiao/auto-pairs",
    {
      "editorconfig/editorconfig-vim",
      setup = function()
        vim.g.EditorConfig_max_line_indicator = "none"
        vim.g.EditorConfig_preserve_formatoptions = 1
      end,
    },
  }

  -- Git
  use {
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
  }

  -- Marks
  use "kshenoy/vim-signature"

  -- Search
  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }
  use "nvim-telescope/telescope-ui-select.nvim"

  -- AI
  use "github/copilot.vim"
  use {
    "CopilotC-Nvim/CopilotChat.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
