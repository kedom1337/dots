return {
  "echasnovski/mini.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  -- stylua: ignore
  keys = {
    { "<leader>e", function() MiniFiles.open() end, "Open file explorer" }
  },
  config = function()
    require("mini.surround").setup()
    require("mini.pairs").setup()
    require("mini.splitjoin").setup()
    require("mini.move").setup()
    require("mini.statusline").setup({
      set_vim_settings = false,
    })
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
    local hipatterns = require("mini.hipatterns")
    hipatterns.setup({
      highlighters = {
        fixme = {
          pattern = "%f[%w]()FIXME()%f[%W]",
          group = "MiniHipatternsFixme",
        },
        hack = {
          pattern = "%f[%w]()HACK()%f[%W]",
          group = "MiniHipatternsHack",
        },
        todo = {
          pattern = "%f[%w]()TODO()%f[%W]",
          group = "MiniHipatternsTodo",
        },
        note = {
          pattern = "%f[%w]()NOTE()%f[%W]",
          group = "MiniHipatternsNote",
        },
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })
  end,
}
