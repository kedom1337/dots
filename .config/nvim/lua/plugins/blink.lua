return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  build = "cargo build --release",
  opts = {
    keymap = "enter",
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
