return {
  "NvChad/nvterm",
  config = true,
  keys = {
    { "<A-i>", "<cmd> lua require('nvterm.terminal').toggle('float') <cr>", desc = "Open floating terminal" },
    {
      "<A-i>",
      "<cmd> lua require('nvterm.terminal').toggle('float') <cr>",
      mode = "t",
      desc = "Open floating terminal",
    },
  },
}
