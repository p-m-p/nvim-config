local ok, schemastore = pcall(function()
  return require "schemastore"
end)

if not ok then
  return
end

vim.lsp.config["jsonls"] = {
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
      validate = { enable = true },
    },
  },
}
