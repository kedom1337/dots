return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>l",
      function()
        require("conform").format()
      end,
      desc = "Format code",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      rust = { "rustfmt" },
      ["_"] = { "trim_whitespace" },
    },
  },
}
