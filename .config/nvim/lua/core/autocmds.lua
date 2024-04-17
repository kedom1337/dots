local cmd = vim.api.nvim_create_autocmd

local augroup = vim.api.nvim_create_augroup("CustomSettings", {})

cmd("FileType", {
  group = augroup,
  pattern = { "dap*", "json" },
  callback = function()
    vim.wo.spell = false
  end,
})

cmd("BufEnter", {
  group = augroup,
  callback = function()
    if vim.bo.filetype == "terminal" then
      vim.wo.spell = false
    end
  end,
})

cmd("VimResized", {
  group = augroup,
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup,
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  callback = function()
    vim.cmd("setlocal formatoptions-=c formatoptions-=o")
  end,
})
