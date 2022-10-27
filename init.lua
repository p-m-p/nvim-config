vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[
  set number

  nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>
  nnoremap <leader>c :noh<cr>
]])

require("plugins")
