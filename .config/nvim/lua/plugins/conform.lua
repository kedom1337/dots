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
      typescript = { "prettierd" },
      javascript = { "prettierd" },
      html = { "prettierd" },
      scss = { "prettierd" },
      css = { "prettierd" },
      json = { "prettierd" },
      ["_"] = { "trim_whitespace" },
    },
  },
}
