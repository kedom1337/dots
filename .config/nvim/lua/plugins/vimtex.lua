return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "out",
      options = {
        "-interaction=nonstopmode",
        "-synctex=1",
        "-verbose",
        "-file-line-error",
        "-outdir=out",
        "-pdf",
      },
    }

    vim.g.vimtex_view_general_viewer = "okular"
    vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
  end,
}
