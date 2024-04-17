return {
  "stevearc/conform.nvim",
  -- stylua: ignore
  keys = {
    { "<leader>l", function() require("conform").format() end, desc = "Format code" }
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      rust = { "rustfmt" },
      typescript = { { "prettierd", "prettier" } },
      javascript = { { "prettierd", "prettier" } },
      html = { { "prettierd", "prettier" } },
      scss = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      ["_"] = { "trim_whitespace" },
    },
  },
}
