return {
  "stevearc/conform.nvim",
  dependencies = {
    {
      "frostplexx/mason-bridge.nvim",
      config = true,
      dependencies = {
        "williamboman/mason.nvim",
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>l", function() require("conform").format() end, desc = "Format code" }
  },
  config = function()
    local f = require("mason-bridge").get_formatters()
    f["_"] = { "trim_whitespace" }
    f["rust"] = { "rustfmt" }

    require("conform").setup({
      formatters_by_ft = f,
    })
  end,
}
