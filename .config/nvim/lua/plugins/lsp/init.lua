return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    { "williamboman/mason.nvim", config = true },
    "b0o/SchemaStore.nvim",
  },
  event = "BufReadPre",
  keys = {
    { "K", vim.lsp.buf.hover, desc = "Lsp hover" },
    { "gr", vim.lsp.buf.references, desc = "Lsp references" },
    { "gi", vim.lsp.buf.implementation, desc = "Lsp implementation" },
    { "gd", vim.lsp.buf.definition, desc = "Lsp definition" },
    { "gD", vim.lsp.buf.declaration, desc = "Lsp declaration" },
    { "<leader>s", vim.lsp.buf.signature_help, desc = "Lsp signature help" },
    { "<leader>ra", vim.lsp.buf.rename, desc = "Lsp rename" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Lsp code action" },
    { "<leader>D", vim.diagnostic.open_float, desc = "Opens current diagnostic" },
    { "<c-up>", vim.diagnostic.goto_prev, desc = "Jump to previous diagnostic" },
    { "<c-down>", vim.diagnostic.goto_next, desc = "Jump to next diagnostic" },
    { "<leader>M", "<cmd>Mason<cr>", desc = "Open package manager" },
  },
  config = function()
    local lsp = require("mason-lspconfig")

    vim.diagnostic.config({
      severity_sort = true,
      float = {
        border = "rounded",
        focusable = false,
      },
    })

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    lsp.setup({
      automatic_installation = true,
      ensure_installed = { "lua_ls" },
    })

    lsp.setup_handlers({
      function(server_name)
        local ok, opts = pcall(require, "plugins.lsp." .. server_name)
        if not ok then
          opts = {}
        end

        require("lspconfig")[server_name].setup(opts)
      end,
      ["rust_analyzer"] = function() end,
    })
  end,
}
