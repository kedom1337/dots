return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<C-n>", "<cmd> NvimTreeToggle <cr>", desc = "toggle file explorer" },
    { "<leader>e", "<cmd> NvimTreeFocus <cr>", desc = "focus file explorer" },
  },
  opts = {
    disable_netrw = true,
    renderer = {
      indent_markers = { enable = true },
      root_folder_label = false,
    },
    diagnostics = { enable = true },
  },
}
