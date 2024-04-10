return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<c-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
    { "<leader>e", "<cmd>NvimTreeFocus<cr>", desc = "Focus file explorer" },
  },
  opts = {
    disable_netrw = true,
    renderer = {
      indent_markers = {
        enable = true,
      },
      root_folder_label = false,
    },
    diagnostics = {
      enable = true,
    },
  },
}
