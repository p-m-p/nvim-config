require("mason").setup()

require("mason-lspconfig").setup {
  ensure_installed = {
    "bashls",
    "cssls",
    "dockerls",
    "eslint",
    "jsonls",
    "kotlin_language_server",
    "html",
    "lua_ls",
    "marksman",
    "stylelint_lsp",
    "tailwindcss",
    "tsserver",
  },
  automatic_installation = true,
}

require("mason-null-ls").setup {
  automatic_installation = true,
  ensure_installed = {
    "codespell",
    "prettierd",
    "selene",
    "stylua",
    "yamllint",
  },
}
