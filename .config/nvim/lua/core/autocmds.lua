local cmd = vim.api.nvim_create_autocmd

local augroup = vim.api.nvim_create_augroup("CustomSettings", {})

cmd("FileType", {
  group = augroup,
  pattern = { "dap*", "json" },
  callback = function()
    vim.wo.spell = false
  end,
  desc = "Disable spell checking for DAP windows",
})

cmd("VimResized", {
  group = augroup,
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
  desc = "Resize split windows when window resizes",
})

cmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup,
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
  desc = "Reload file when external changes take place",
})

cmd("FileType", {
  group = augroup,
  callback = function()
    vim.bo.formatoptions = vim.bo.formatoptions:gsub("[co]", "")
  end,
  desc = "No comment prefix when using o on comment",
})
