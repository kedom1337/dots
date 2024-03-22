return {
  "echasnovski/mini.nvim",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
    },
  },
  event = "VeryLazy",
  config = function()
    require("mini.comment").setup({
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    })
    require("mini.surround").setup()
    require("mini.pairs").setup()
    require("mini.jump2d").setup({
      allowed_lines = {
        blank = false,
        cursor_at = false,
      },
    })
  end,
}
