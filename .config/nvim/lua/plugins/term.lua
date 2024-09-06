return {
  "akinsho/toggleterm.nvim",
  config = true,
  keys = {
    { "<a-i>", "<cmd>ToggleTerm direction=float<cr>", desc = "Open floating terminal" },
    { "<a-i>", "<cmd>ToggleTerm<cr>", mode = "t", desc = "Open floating terminal" },
  },
}
