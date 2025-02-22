local all_ok, configs, parsers = pcall(function()
  return require "nvim-treesitter.configs", require "nvim-treesitter.parsers"
end)

if not all_ok then
  return
end

configs.setup {
  ensure_installed = {
    "css",
    "html",
    "lua",
    "markdown",
    "tsx",
    "typescript",
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
  },
}

local parser_config = parsers.get_parser_configs()
parser_config.embedded_template = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
    files = { "src/parser.c" },
    requires_generate_from_grammar = false,
  },
}

vim.treesitter.language.register("embedded_template", "ejs")
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.ejs",
  command = "set filetype=ejs",
})

vim.filetype.add {
  extension = {
    njk = "jinja",
  },
}
vim.treesitter.language.register("embedded_template", "jinja")
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.njk",
  command = "set filetype=jinja",
})
