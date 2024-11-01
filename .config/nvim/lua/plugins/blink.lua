return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  build = "cargo build --release",
  opts = {
    keymap = {
      preset = "default",
      ["<cr>"] = { "select_and_accept", "fallback" },
    },
    highlight = {
      use_nvim_cmp_as_default = true,
    },
    accept = {
      auto_brackets = { enabled = true },
    },
    trigger = {
      signature_help = { enabled = true },
    },
  },
}
