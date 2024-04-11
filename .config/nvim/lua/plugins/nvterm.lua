return {
  "NvChad/nvterm",
  config = true,
  --stylua: ignore
  keys = {
    { "<a-i>", function() require("nvterm.terminal").toggle("float") end, desc = "Open floating terminal" },
    { "<a-i>", function() require("nvterm.terminal").toggle("float") end, mode = "t", desc = "Open floating terminal" },
  },
}
