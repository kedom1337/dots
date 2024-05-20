local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr }
vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, opts)
