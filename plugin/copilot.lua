local ok, chat = pcall(require, "CopilotChat")

if not ok then
  return
end

chat.setup {
  model = "claude-3.5-sonnet",
}

vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

vim.keymap.set({ "n" }, "<leader>aa", chat.toggle, { desc = "AI Toggle" })
vim.keymap.set({ "v" }, "<leader>aa", chat.open, { desc = "AI Open" })
vim.keymap.set({ "n" }, "<leader>ax", chat.reset, { desc = "AI Reset" })
vim.keymap.set({ "n" }, "<leader>as", chat.stop, { desc = "AI Stop" })
vim.keymap.set({ "n" }, "<leader>am", chat.select_model, { desc = "AI Models" })
vim.keymap.set({ "n" }, "<leader>ag", chat.select_agent, { desc = "AI Agents" })
vim.keymap.set({ "n", "v" }, "<leader>ap", chat.select_prompt, { desc = "AI Prompts" })
vim.keymap.set({ "n", "v" }, "<leader>aq", function()
  vim.ui.input({
    prompt = "AI Question> ",
  }, function(input)
    if input ~= "" then
      chat.ask(input)
    end
  end)
end, { desc = "AI Question" })
