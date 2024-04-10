return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  config = function()
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
