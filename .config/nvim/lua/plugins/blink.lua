return {
  "saghen/blink.cmp",
  build = 'cargo build --release',
  opts = {
    keymap = {
      accept = "<cr>",
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
