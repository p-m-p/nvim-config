vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeToggle<cr>", {
  silent = true
})

require("nvim-tree").setup {
  sort_by = "case_sensitive",
  open_on_tab = true,
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "<C-h>", action = "split" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    custom = { "^.git$" }
  },
}
