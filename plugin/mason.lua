require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "bashls",
    "cssls",
    "eslint",
    "jsonls",
    "html",
    "lua_ls",
    "marksman",
    "stylelint_lsp",
    "tailwindcss",
    "tsserver",
  },
  automatic_installation = true,
}
