return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  config = function()
    local navic = require("nvim-navic")

    require("lualine").setup({
      options = {
        component_separators = "",
        section_separators = "",
        globalstatus = true,
      },
      winbar = {
        lualine_c = {
          {
            function()
              return navic.get_location() .. " "
            end,
          },
        },
      },
    })
  end,
}
