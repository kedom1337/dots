return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nivm-tree/nvim-web-devicons",
  },
  config = true,
  -- stylua: ignore
  keys = {
    {"<leader>f", function() require("fzf-lua").files() end, "Find git files",},
    {"<leader>g", function() require("fzf-lua").live_grep() end, "Live grep",},
    {"<leader>k", function() require("fzf-lua").keymaps() end, "Show keys",},
  },
}
