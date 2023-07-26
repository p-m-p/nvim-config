local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr, async = false }
        end,
      })
    end
  end,

  sources = {
    null_ls.builtins.diagnostics.codespell,
    null_ls.builtins.diagnostics.selene,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.formatting.ktlint,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua,
  },
}
