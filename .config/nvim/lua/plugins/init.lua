return {
  "neovim/nvim-lspconfig",
  "nvim-tree/nvim-web-devicons",
  "b0o/SchemaStore.nvim",
  { "williamboman/mason.nvim", config = true },
  { "lewis6991/gitsigns.nvim", event = "BufReadPre", config = true },
  { "j-hui/fidget.nvim", event = "LspAttach", config = true },
}
