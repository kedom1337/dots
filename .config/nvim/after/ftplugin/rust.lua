local o = vim.opt
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4

vim.keymap.set("n", "<leader>dd", function()
  vim.cmd.RustLsp("debuggables")
end, { desc = "Write" })
