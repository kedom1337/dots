local cmd = vim.api.nvim_create_autocmd

cmd("FileType", {
  pattern = { "dap*", "json" },
  callback = function()
    vim.wo.spell = false
  end,
})

cmd("BufEnter", {
  callback = function()
    if vim.bo.filetype == "terminal" then
      vim.wo.spell = false
    end
  end,
})
