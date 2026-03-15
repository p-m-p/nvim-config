-- Plugin-specific globals (must be set before loading plugins)
vim.g.EditorConfig_max_line_indicator = "none"
vim.g.EditorConfig_preserve_formatoptions = 1

vim.g.mapleader = ";"

vim.o.updatetime = 250
vim.o.number = true

vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  virtual_text = true,
}

vim.api.nvim_set_keymap("n", "<leader>c", ":noh<cr>", {
  silent = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufopts = { noremap = true, silent = true, buffer = args.buf }
    local float_opts = { focusable = false, border = "single", source = true }

    vim.keymap.set("n", "<leader>k", function()
      vim.lsp.buf.hover(float_opts)
    end, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format { async = true }
    end, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "ca", function()
      vim.lsp.buf.code_action()
    end, bufopts)
    vim.keymap.set("n", "<leader>[", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "<leader>]", vim.diagnostic.goto_next, bufopts)

    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = args.buf,
      callback = function()
        vim.diagnostic.open_float(nil, float_opts)
      end,
    })
  end,
})

-- Plugins via vim-plug (https://github.com/junegunn/vim-plug)
local vim_plug_path = vim.fn.stdpath "data" .. "/site/autoload/plug.vim"
local vim_plug_missing = vim.fn.empty(vim.fn.glob(vim_plug_path)) > 0

if vim_plug_missing then
  vim.fn.system {
    "curl",
    "-fLo",
    vim_plug_path,
    "--create-dirs",
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
  }
end

local Plug = vim.fn["plug#"]

vim.call "plug#begin"

-- Core dependencies
Plug "nvim-lua/plenary.nvim"

-- Editor
Plug "nvim-tree/nvim-web-devicons"
Plug "nvim-lualine/lualine.nvim"
Plug "nvim-tree/nvim-tree.lua"
Plug("catppuccin/nvim", { as = "catppuccin" })
Plug "editorconfig/editorconfig-vim"
Plug "jiangmiao/auto-pairs"
Plug "kshenoy/vim-signature"
Plug("nvim-telescope/telescope.nvim", { tag = "v0.2.1" })
Plug "nvim-telescope/telescope-ui-select.nvim"
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })

-- LSP
Plug "folke/lazydev.nvim"
Plug("williamboman/mason.nvim", { ["do"] = ":MasonUpdate" })
Plug "williamboman/mason-lspconfig.nvim"
Plug "neovim/nvim-lspconfig"
Plug "nvimtools/none-ls.nvim"
Plug "hrsh7th/cmp-nvim-lsp"
Plug "hrsh7th/cmp-buffer"
Plug "hrsh7th/cmp-path"
Plug "hrsh7th/cmp-cmdline"
Plug "hrsh7th/nvim-cmp"
Plug "b0o/SchemaStore.nvim"
Plug "mfussenegger/nvim-jdtls"

-- Git
Plug "tpope/vim-fugitive"
Plug "tpope/vim-rhubarb"

-- AI
Plug "github/copilot.vim"
Plug "CopilotC-Nvim/CopilotChat.nvim"

vim.call "plug#end"

-- Auto-install plugins on first run
if vim_plug_missing then
  vim.cmd "PlugInstall --sync"
end

-- Set colorscheme (silently fail if not installed yet)
pcall(vim.cmd.colorscheme, "catppuccin-mocha")
