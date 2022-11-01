vim.o.updatetime = 250

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost"  },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',

    }
    vim.diagnostic.open_float(nil, opts)
  end
})
vim.diagnostic.config({
  virtual_text = false
})
