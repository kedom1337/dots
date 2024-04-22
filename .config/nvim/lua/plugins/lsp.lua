return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "b0o/SchemaStore.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "williamboman/mason.nvim", config = true },
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
    { "<leader>i", vim.diagnostic.open_float, desc = "Opens current diagnostic" },
    { "<c-up>", vim.diagnostic.goto_prev, desc = "Jump to previous diagnostic" },
    { "<c-down>", vim.diagnostic.goto_next, desc = "Jump to next diagnostic" },
    { "<leader>M", "<cmd>Mason<cr>", desc = "Open package manager" },
  },
  config = function()
    local lsp = require("mason-lspconfig")
    local border = "rounded"

    require("lspconfig.ui.windows").default_options = {
      border = border,
    }

    vim.diagnostic.config({
      severity_sort = true,
      float = {
        border = border,
        focusable = false,
      },
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = border,
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = border,
    })

    lsp.setup({
      automatic_installation = true,
      ensure_installed = { "lua_ls" },
    })

    lsp.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,
      ["rust_analyzer"] = function() end,
      ["jsonls"] = function()
        require("lspconfig")["jsonls"].setup({
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = {
                enable = true,
              },
            },
          },
        })
      end,
      ["lua_ls"] = function()
        require("lspconfig")["lua_ls"].setup({
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                },
              },
              diagnostics = {
                globals = { "MiniFiles" },
              },
            },
          },
        })
      end,
    })
  end,
}