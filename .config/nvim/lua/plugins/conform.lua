return {
  "stevearc/conform.nvim",
  -- stylua: ignore
  keys = {
    { "<leader>l", function() require("conform").format() end, desc = "Format code" }
  },
  opts = {
    formatters_by_ft = {
      ["_"] = { "trim_whitespace" },
      lua = { "stylua" },
      python = { "black" },
      rust = { "rustfmt" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
    },
  },
}
