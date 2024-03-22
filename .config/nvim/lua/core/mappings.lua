local map = vim.keymap.set

map("n", "<leader>w", "<cmd> w! <CR>", { desc = "Write" })
map("n", "<leader>q", "<cmd> q <CR>", { desc = "Quit" })
map("n", "<leader>c", "<cmd> setlocal spell! <CR>", { desc = "Toggle spell check" })
map("n", "<leader>X", "<cmd> w | %bd | e# | bd# <CR><CR>", { desc = "Close all but the current buffer" })
map("n", "<leader>,", "A;<ESC>", { desc = "Semicolon at end of line" })
map("n", "<leader>.", "f,a<CR><ESC>", { desc = "Indent function argument" })
map("n", "<ESC>", "<cmd> noh <cr>", { desc = "No highlight" })
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
