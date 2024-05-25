local map = vim.keymap.set

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<leader>w", "<cmd>w!<cr>", { desc = "Write" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

map("n", "<leader>c", "<cmd>setlocal spell!<cr>", { desc = "Toggle spell check" })
map("n", "<leader>X", "<cmd>w|%bd|e#|bd#<cr><cr>", { desc = "Close all but the current buffer" })
map("n", "<leader>,", "A;<esc>", { desc = "Semicolon at end of line" })
map("n", "<leader>.", "f,a<cr><esc>", { desc = "Indent function argument" })

map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

map("n", "<c-h>", "<c-w>h", { desc = "Window left" })
map("n", "<c-l>", "<c-w>l", { desc = "Window right" })
map("n", "<c-j>", "<c-w>j", { desc = "Window down" })
map("n", "<c-k>", "<c-w>k", { desc = "Window up" })

map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

map({ "i", "s" }, "<tab>", function()
  if vim.snippet.active({ direction = 1 }) then
    return "<cmd>lua vim.snippet.jump(1)<cr>"
  else
    return "<tab>"
  end
end, { expr = true, desc = "Jump to next snippet placeholder" })

map({ "i", "s" }, "<s-tab>", function()
  if vim.snippet.active({ direction = -1 }) then
    return "<cmd>lua vim.snippet.jump(-1)<cr>"
  else
    return "<s-tab>"
  end
end, { expr = true, desc = "Jump to previous snippet placeholder" })
