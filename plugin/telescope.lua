require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown()
    }
  }
}
require("telescope").load_extension("ui-select")

local builtin = require('telescope.builtin')
local bufopts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>d", function() builtin.lsp_type_definitions() end, bufopts)
vim.keymap.set("n", "<leader>r", function() builtin.lsp_references() end, bufopts)
vim.keymap.set("n", "<leader>/", function() builtin.live_grep() end, bufopts)
vim.keymap.set("n", "<leader>*", function() builtin.grep_string() end, bufopts)
vim.keymap.set("n", "<leader>\"", function() builtin.registers() end, bufopts)
