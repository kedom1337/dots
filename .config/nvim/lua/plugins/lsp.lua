return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "b0o/SchemaStore.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "williamboman/mason.nvim", config = true },
  },
  event = "BufReadPre",
  keys = {
    { "<leader>i", vim.diagnostic.open_float, desc = "Opens current diagnostic" },
    { "<leader>M", "<cmd>Mason<cr>", desc = "Open package manager" },
  },
  config = function()
    local mason_lsp = require("mason-lspconfig")
    mason_lsp.setup({
      automatic_installation = true,
      ensure_installed = { "lua_ls" },
    })

    mason_lsp.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = require("blink.cmp").get_lsp_capabilities(),
        })
      end,
      ["vtsls"] = function()
        require("lspconfig").vtsls.setup({
          typescript = {
            tsserver = { maxTsServerMemory = 12288 },
          },
          experimental = {
            completion = { entriesLimit = 3 },
          },
        })
      end,
      ["jsonls"] = function()
        require("lspconfig")["jsonls"].setup({
          capabilities = require("blink.cmp").get_lsp_capabilities(),
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        })
      end,
      ["lua_ls"] = function()
        require("lspconfig")["lua_ls"].setup({
          capabilities = require("blink.cmp").get_lsp_capabilities(),
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME },
              },
            },
          },
        })
      end,
    })
  end,
}
