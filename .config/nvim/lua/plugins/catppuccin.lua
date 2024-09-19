return {
  "nyoom-engineering/oxocarbon.nvim",
  -- "catppuccin/nvim",
  -- name = "catppuccin",
  init = function()
    vim.opt.background = "dark"
    -- vim.cmd.colorscheme("catppuccin")
    vim.cmd.colorscheme("oxocarbon")
  end,
  -- opts = {
  --   custom_highlights = function(colors)
  --     return {
  --       WinBar = { bg = colors.mantle },
  --     }
  --   end,
  -- },
}
