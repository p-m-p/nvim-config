local all_ok, mason, mason_lspconfig = pcall(function()
  return require "mason", require "mason-lspconfig"
end)

if not all_ok then
  return
end

mason.setup()
mason_lspconfig.setup {
  automatic_installation = true,
  ensure_installed = {
    "cssls",
    "dockerls",
    "eslint",
    "jsonls",
    "html",
    "lua_ls",
    "marksman",
    "stylelint_lsp",
    "ts_ls",
  },
}
