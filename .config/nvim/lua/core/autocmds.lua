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

cmd("VimResized", {
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})
