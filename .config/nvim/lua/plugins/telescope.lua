local is_inside_work_tree = {}

local function project_files()
  local opts = {
    show_untracked = true,
  }

  local cwd = vim.fn.getcwd()
  if is_inside_work_tree[cwd] == nil then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
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
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("projects")
  end,
}
