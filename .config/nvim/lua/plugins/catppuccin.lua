return {
  "catppuccin/nvim",
  name = "catppuccin",
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
  opts = {
    custom_highlights = function(colors)
      return {
        WinBar = { bg = colors.mantle },
      }
    end,
    integrations = {
      mini = {
        enabled = true,
      },
    },
  },
}
