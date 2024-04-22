local function project_files()
  local opts = {}
  if vim.loop.fs_stat(".git") then
    opts.show_untracked = true
    require("telescope.builtin").git_files(opts)
  else
    require("telescope.builtin").find_files(opts)
  end
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
      "ahmedkhalf/project.nvim",
      name = "project_nvim",
      config = true,
      lazy = false,
    },
  },
  keys = {
    { "<leader>f", project_files, "Find files" },
    { "<leader>g", "<cmd>Telescope live_grep<cr>", "Live grep" },
    { "<leader>k", "<cmd>Telescope keymaps<cr>", "Show keys" },
    { "<leader>p", "<cmd>Telescope projects<cr>", "Find projects" },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("projects")
  end,
}
