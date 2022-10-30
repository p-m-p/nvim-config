vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ";"

vim.o.number = true

vim.api.nvim_set_keymap("n", "<leader>c", ":noh<cr>", {
  silent = true
})
vim.api.nvim_set_keymap("n", "ca", "", {
  silent = true,
  callback = function ()
    vim.lsp.buf.code_action()
  end
})

-- Diagnostic gutter icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

require("plugins")
