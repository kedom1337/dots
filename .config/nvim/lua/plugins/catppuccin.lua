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
      navic = {
        enabled = true,
        custom_bg = "#181825",
      },
    },
  },
}
