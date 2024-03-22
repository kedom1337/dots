return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require("lualine").setup({
      options = {
        component_separators = "",
        section_separators = "",
        globalstatus = true,
      },
    })
  end,
}
