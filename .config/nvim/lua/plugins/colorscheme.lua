-- return {
--   "nyoom-engineering/oxocarbon.nvim",
--   init = function()
--     vim.opt.background = "dark"
--     vim.cmd.colorscheme("oxocarbon")
--   end,
-- }

return {
  "wtfox/jellybeans.nvim",
  priority = 1000,
  config = function()
    require("jellybeans").setup()
    vim.cmd.colorscheme("jellybeans")
  end,
}
