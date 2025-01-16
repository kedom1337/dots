return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = {
      enabled = true,
    },
  },
  keys = {
    {
      "<a-i>",
      function()
        Snacks.terminal.toggle("fish")
      end,
      desc = "Open floating terminal",
    },
    {
      "<a-i>",
      mode = "t",
      function()
        Snacks.terminal.toggle("fish")
      end,
      desc = "Open floating terminal",
    },
  },
}
