return {
  "echasnovski/mini.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  event = "VeryLazy",
  -- stylua: ignore
  keys = {
    ---@diagnostic disable-next-line: undefined-global
    { "<leader>e", function() MiniFiles.open() end, "Open file explorer" },
  },
  config = function()
    require("mini.surround").setup()
    require("mini.pairs").setup()
    require("mini.splitjoin").setup()
    require("mini.move").setup()
    require("mini.statusline").setup({ set_vim_settings = false })
    require("mini.files").setup({
      options = {
        use_as_default_explorer = false,
      },
      windows = { preview = true },
    })
    local ai = require("mini.ai")
    ai.setup({
      custom_textobjects = {
        F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
      },
      silent = true,
    })
    local jump2d = require("mini.jump2d")
    jump2d.setup({
      spotter = jump2d.builtin_opts.word_start.spotter,
      labels = "asdfjklghrnvbmceuowqptyi",
      allowed_lines = {
        cursor_at = false,
      },
      view = {
        n_steps_ahead = 2,
      },
      silent = true,
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
