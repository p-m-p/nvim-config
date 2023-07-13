vim.api.nvim_set_keymap("n", "<leader>tr", ":TroubleToggle<cr>", {
  silent = true,
})

require("trouble").setup()
