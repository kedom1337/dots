return {
  "mfussenegger/nvim-lint",
  event = "BufReadPre",
  init = function()
    vim.env.ESLINT_D_PPID = vim.fn.getpid()
    require("lint").linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      callback = function()
        local client = vim.lsp.get_clients({ bufnr = 0 })[1] or {}
        require("lint").try_lint(nil, { cwd = client.root_dir })
      end,
    })
  end,
}
