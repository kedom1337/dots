return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
      "ahmedkhalf/project.nvim",
      name = "project_nvim",
      lazy = false,
      config = true,
    },
  },
  keys = {
    { "<leader>f", "<cmd>Telescope git_files<cr>", "Find git files" },
    { "<leader>F", "<cmd>Telescope find_files<cr>", "Find files" },
    { "<leader>g", "<cmd>Telescope live_grep<cr>", "Live grep" },
    { "<leader>k", "<cmd>Telescope keymaps<cr>", "Show keys" },
    { "<leader>p", "<cmd>Telescope projects<cr>", "Find projects" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        mappings = {
          i = { ["<esc>"] = actions.close },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("projects")
  end,
}
