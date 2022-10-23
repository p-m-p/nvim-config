vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[
  set tabstop=2
  set shiftwidth=2
  set nocompatible
  set number
  set autoindent
  set smartindent
  set smarttab
  set expandtab
  set ttimeoutlen=50
  set laststatus=2
  set incsearch
  set ignorecase smartcase

  nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>
]])

require("plugins")
