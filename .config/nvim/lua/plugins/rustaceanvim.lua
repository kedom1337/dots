return {
  "mrcjkb/rustaceanvim",
  lazy = false,
  init = function()
    vim.g.rustaceanvim = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            imports = { preferNoStd = true },
          },
        },
      },
    }
  end,
}
