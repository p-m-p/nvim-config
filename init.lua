--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ";"

vim.o.updatetime = 250
vim.o.number = true

vim.api.nvim_set_keymap("n", "<leader>c", ":noh<cr>", {
  silent = true,
})
vim.api.nvim_set_keymap("n", "ca", "", {
  silent = true,
  callback = function()
    vim.lsp.buf.code_action()
  end,
})

--vim.opt.clipboard = "unnamedplus"

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

require "plugins"
