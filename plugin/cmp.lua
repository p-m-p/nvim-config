local all_ok, cmp, cmp_nvim_lsp, lspconfig, mason_lspconfig, schemastore = pcall(function()
  return require "cmp", require "cmp_nvim_lsp", require "lspconfig", require "mason-lspconfig", require "schemastore"
end)

if not all_ok then
  return
end

cmp.setup {
  mapping = cmp.mapping.preset.insert {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
        else
          cmp.confirm()
        end
      else
        fallback()
      end
    end, { "i", "s", "c" }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  }),
}

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

local on_attach = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local float_opts = { focusable = false, border = "single" }

  vim.keymap.set("n", "<leader>k", function()
    vim.lsp.buf.hover(float_opts)
  end, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format { async = true }
  end, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      vim.diagnostic.open_float(nil, float_opts)
    end,
  })
end

local capabilities = cmp_nvim_lsp.default_capabilities()
local opts = { capabilities = capabilities, on_attach = on_attach }

mason_lspconfig.setup_handlers {
  function(server_name)
    if server_name == "stylelint_lsp" then
      lspconfig.stylelint_lsp.setup {
        capabilities = capabilities,
        filetypes = { "css" },
        on_attach = on_attach,
      }
    elseif server_name == "jsonls" then
      lspconfig.jsonls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          json = {
            schemas = schemastore.json.schemas(),
            validate = { enable = true },
          },
        },
      }
    elseif server_name == "cssls" then
      lspconfig.cssls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          css = {
            validate = false,
          },
        },
      }
    else
      lspconfig[server_name].setup(opts)
    end
  end,
}
