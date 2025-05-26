vim.g.mapleader = ";"

vim.o.updatetime = 250
vim.o.number = true

vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  virtual_text = true,
}

vim.api.nvim_set_keymap("n", "<leader>c", ":noh<cr>", {
  silent = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufopts = { noremap = true, silent = true, buffer = args.buf }
    local float_opts = { focusable = false, border = "single" }

    vim.keymap.set("n", "<leader>k", function()
      vim.lsp.buf.hover(float_opts)
    end, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format { async = true }
    end, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "ca", function()
      vim.lsp.buf.code_action()
    end, bufopts)

    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = args.buf,
      callback = function()
        vim.diagnostic.open_float(nil, float_opts)
      end,
    })
  end,
})

require "plugins"
