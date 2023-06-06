require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "css",
    "html",
    "java",
    "lua",
    "markdown",
    "tsx",
    "typescript",
    "svelte",
    "embedded_template",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.embedded_template = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
    files = {"src/parser.c"},
    requires_generate_from_grammar = false,
  },
}

vim.treesitter.language.register("embedded_template", "ejs")
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.ejs",
  command = "set filetype=ejs"
})
