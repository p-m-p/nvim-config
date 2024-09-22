local all_ok, mason, mason_lspconfig, mason_null_ls = pcall(function()
  return require "mason", require "mason-lspconfig", require "mason-null-ls"
end)

if not all_ok then
  return
end

mason.setup()
mason_lspconfig.setup {
  automatic_installation = true,
  ensure_installed = {
    "bashls",
    "cssls",
    "dockerls",
    "eslint",
    "jsonls",
    "html",
    "lua_ls",
    "marksman",
    "stylelint_lsp",
    "tailwindcss",
    "ts_ls",
  },
}
mason_null_ls.setup {
  automatic_installation = true,
  ensure_installed = {
    "codespell",
    "prettier",
    "selene",
    "shellcheck",
    "stylua",
    "yamllint",
  },
}
