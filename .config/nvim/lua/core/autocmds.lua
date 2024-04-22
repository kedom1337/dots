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

cmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "Highlight on yank",
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

cmd("FileType", {
  group = augroup,
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "notify",
    "qf",
    "query",
    "startuptime",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
  desc = "Close some filetypes with <q>",
})

cmd("FileType", {
  group = augroup,
  pattern = { "man" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
  end,
  desc = "Make it easier to close man-files when opened inline",
})

cmd({ "FileType" }, {
  group = augroup,
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
  desc = "Fix conceallevel for json files",
})
