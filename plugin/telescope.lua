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
vim.keymap.set("n", "<leader>d", function()
  builtin.lsp_type_definitions()
end, bufopts)
vim.keymap.set("n", "<leader>r", function()
  builtin.lsp_references()
end, bufopts)
vim.keymap.set("n", "<leader>/", function()
  builtin.live_grep()
end, bufopts)
vim.keymap.set("n", "<leader>*", function()
  builtin.grep_string()
end, bufopts)
vim.keymap.set("n", '<leader>"', function()
  builtin.registers()
end, bufopts)
vim.keymap.set("n", "<leader>gs", function()
  builtin.git_status()
end, bufopts)
vim.keymap.set("n", "<leader>gt", function()
  builtin.git_stash()
end, bufopts)
vim.keymap.set("n", "<leader>gb", function()
  builtin.git_branches()
end, bufopts)
vim.keymap.set("n", "<leader>gc", function()
  builtin.git_commits()
end, bufopts)
vim.keymap.set("n", "<leader>gbc", function()
  builtin.git_bcommits()
end, bufopts)
