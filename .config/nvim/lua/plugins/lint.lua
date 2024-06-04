return {
  "mfussenegger/nvim-lint",
  dependencies = {
    {
      "frostplexx/mason-bridge.nvim",
      config = true,
      dependencies = {
        "williamboman/mason.nvim",
      },
    },
  },
  event = "BufReadPre",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = require("mason-bridge").get_linters()

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
