return {
  "saghen/blink.cmp",
  version = "v0.*",
  opts = {
    keymap = {
      accept = "<cr>",
    },
    highlight = {
      use_nvim_cmp_as_default = true,
    },
    nerd_font_variant = "normal",
    accept = {
      auto_brackets = { enabled = true },
    },
    trigger = {
      signature_help = { enabled = true },
    },
  },
}
