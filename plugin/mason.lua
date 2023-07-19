require("mason").setup()

require("mason-lspconfig").setup {
  ensure_installed = {
    "bashls",
    "cssls",
    "dockerls",
    "eslint",
    "gradle_ls",
    "jsonls",
    "kotlin_language_server",
    "html",
    "lua_ls",
    "marksman",
    "rubocop",
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
    "shellcheck",
    "stylua",
    "yamllint",
  },
}
