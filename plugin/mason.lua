require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "bashls",
    "cssls",
    "eslint",
    "jsonls",
    "html",
    "marksman",
    "stylelint_lsp",
    "sumneko_lua",
    "tailwindcss",
    "ttsserver",
  },
  automatic_installation = true,
}
