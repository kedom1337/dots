return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  build = "cargo build --release",
  opts = {
    keymap = { preset = "enter" },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
        },
      },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
    },
    signature = {
      enabled = true,
      window = {
        border = "rounded",
      },
    },
  },
}
