local function toggle_terminal()
  require("nvterm.terminal").toggle("float")
end

return {
  "NvChad/nvterm",
  config = true,
  keys = {
    { "<a-i>", toggle_terminal, desc = "Open floating terminal" },
    { "<a-i>", toggle_terminal, mode = "t", desc = "Open floating terminal" },
  },
}
