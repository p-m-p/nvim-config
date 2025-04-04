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
  use "nvim-lua/plenary.nvim"

  -- Editor
  use {
    "nvim-tree/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-tree.lua",
    {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require("catppuccin").setup { flavour = "mocha" }
        vim.api.nvim_command "colorscheme catppuccin"
      end,
    },
    {
      "editorconfig/editorconfig-vim",
      setup = function()
        vim.g.EditorConfig_max_line_indicator = "none"
        vim.g.EditorConfig_preserve_formatoptions = 1
      end,
    },
    "jiangmiao/auto-pairs",
    "kshenoy/vim-signature",
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.8",
    },
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    },
  }

  -- LSP
  use {
    {
      "williamboman/mason.nvim",
      run = ":MasonUpdate",
    },
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "nvimtools/none-ls.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "b0o/SchemaStore.nvim",
    "mfussenegger/nvim-jdtls",
  }

  -- Git
  use {
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
  }

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
