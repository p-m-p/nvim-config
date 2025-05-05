local all_ok, telescope, themes, builtin = pcall(function()
  return require "telescope", require "telescope.themes", require "telescope.builtin"
end)

if not all_ok then
  return
end

telescope.setup {
  extensions = {
    ["ui-select"] = {
      themes.get_dropdown(),
    },
  },
}
telescope.load_extension "ui-select"

local bufopts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>d", builtin.lsp_type_definitions, bufopts)
vim.keymap.set("n", "<leader>i", builtin.lsp_implementations, bufopts)
vim.keymap.set("n", "<leader>r", builtin.lsp_references, bufopts)
vim.keymap.set("n", "<leader>/", builtin.live_grep, bufopts)
vim.keymap.set("n", "<leader>*", builtin.grep_string, bufopts)
vim.keymap.set("n", '<leader>"', builtin.registers, bufopts)
vim.keymap.set("n", "<leader>gs", builtin.git_status, bufopts)
vim.keymap.set("n", "<leader>gt", builtin.git_stash, bufopts)
vim.keymap.set("n", "<leader>gb", builtin.git_branches, bufopts)
vim.keymap.set("n", "<leader>gc", builtin.git_commits, bufopts)
vim.keymap.set("n", "<leader>gbc", builtin.git_bcommits, bufopts)
