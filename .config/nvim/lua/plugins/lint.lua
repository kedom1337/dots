return {
  "mfussenegger/nvim-lint",
  event = "BufReadPre",
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      markdown = { "markdownlint" },
      tex = { "chktex" },
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
