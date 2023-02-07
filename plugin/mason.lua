require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "bashls",
    "cssls",
    "eslint",
    "html",
    "marksman",
    "stylelint_lsp",
    "sumneko_lua",
    "tailwindcss",
    "ttsserver"
  }
}
