return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  -- stylua: ignore
  keys = {
    { "<c-n>", function() MiniFiles.open() end, "Open file explorer" }
  },
  config = function()
    require("mini.surround").setup()
    require("mini.pairs").setup()
    require("mini.files").setup({
      windows = {
        preview = true,
      },
    })
    require("mini.jump2d").setup({
      allowed_lines = {
        blank = false,
        cursor_at = false,
      },
      view = {
        n_steps_ahead = 2,
      },
    })
  end,
}
