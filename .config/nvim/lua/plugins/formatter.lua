return {
  "mhartington/formatter.nvim",
  keys = {
    { "<leader>l", "<cmd> Format <cr>", desc = "Format code" },
  },
  config = function()
    require("formatter").setup({
      filetype = {
        lua = require("formatter.filetypes.lua").stylua,
        json = require("formatter.filetypes.json").prettierd,
        css = require("formatter.filetypes.css").prettierd,
        scss = require("formatter.filetypes.css").prettierd,
        html = require("formatter.filetypes.html").prettierd,
        typescript = require("formatter.filetypes.typescript").prettierd,
        typescriptreact = require("formatter.filetypes.typescriptreact").prettierd,
        javascript = require("formatter.filetypes.javascript").prettierd,
        rust = require("formatter.filetypes.rust").rustfmt,
        ["*"] = require("formatter.filetypes.any").remove_trailing_whitespace,
      },
    })
  end,
}
