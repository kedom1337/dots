return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  opts = {
    options = {
      component_separators = "",
      section_separators = "",
      globalstatus = true,
    },
    winbar = {
      lualine_c = {
        {
          function()
            return require("nvim-navic").get_location() .. " "
          end,
        },
      },
    },
  },
}
