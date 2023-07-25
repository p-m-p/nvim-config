local ok, trouble = pcall(require, "trouble")

if not ok then
  return
end

vim.api.nvim_set_keymap("n", "<leader>tr", ":TroubleToggle<cr>", {
  silent = true,
})

trouble.setup()
