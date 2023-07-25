local all_ok, mason, mason_lspconfig, mason_null_ls = pcall(function()
  return require "mason", require "mason-lspconfig", require "mason-null-ls"
end)

if not all_ok then
  return
end

mason.setup()
mason_lspconfig.setup {
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
mason_null_ls.setup {
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
