require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown()
    }
  }
}
require("telescope").load_extension("ui-select")

local builtin = require('telescope.builtin')
local buffopts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>td", function() builtin.lsp_type_definitions() end, bufopts)
vim.keymap.set("n", "<leader>gr", function() builtin.lsp_references() end, bufopts)
