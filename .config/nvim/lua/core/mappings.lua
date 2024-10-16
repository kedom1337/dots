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
