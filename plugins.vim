" Auto-install vim-plug
let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Core dependencies
Plug 'nvim-lua/plenary.nvim'

" Editor
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kshenoy/vim-signature'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.2.0' }
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" LSP
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvimtools/none-ls.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'b0o/SchemaStore.nvim'
Plug 'mfussenegger/nvim-jdtls'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" AI
Plug 'github/copilot.vim'
Plug 'CopilotC-Nvim/CopilotChat.nvim'

call plug#end()
