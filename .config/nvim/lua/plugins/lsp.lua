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
    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = { "lua_ls" },
    })

    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({})
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
