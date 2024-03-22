vim.cmd.colorscheme("catppuccin")

local colors = require("catppuccin.palettes").get_palette()
require("catppuccin.lib.highlighter").syntax({
  WinBar = { bg = colors.mantle },
})
