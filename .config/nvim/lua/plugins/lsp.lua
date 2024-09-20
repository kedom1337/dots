return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "b0o/SchemaStore.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "williamboman/mason.nvim", config = true },
  },
  event = "BufReadPre",
  keys = {
    { "gr", vim.lsp.buf.references, desc = "Lsp references" },
    { "gi", vim.lsp.buf.implementation, desc = "Lsp implementation" },
    { "gd", vim.lsp.buf.definition, desc = "Lsp definition" },
    { "gD", vim.lsp.buf.declaration, desc = "Lsp declaration" },
    { "<leader>s", vim.lsp.buf.signature_help, desc = "Lsp signature help" },
    { "<leader>ra", vim.lsp.buf.rename, desc = "Lsp rename" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Lsp code action" },
    { "<leader>i", vim.diagnostic.open_float, desc = "Opens current diagnostic" },
    { "<leader>M", "<cmd>Mason<cr>", desc = "Open package manager" },
  },
  config = function()
    vim.diagnostic.config({
      severity_sort = true,
      float = { focusable = false },
    })

    local mason_lsp = require("mason-lspconfig")

    mason_lsp.setup({
      automatic_installation = true,
      ensure_installed = { "lua_ls" },
    })

    mason_lsp.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })
      end,
      ["ts_ls"] = function()
        local vue_mason_path = require("mason-registry").get_package("vue-language-server"):get_install_path()
        local vue_ls_path = vue_mason_path .. "/node_modules/@vue/language-server"

        require("lspconfig")["ts_ls"].setup({
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vue_ls_path,
                languages = { "javascript", "typescript", "vue" },
              },
            },
          },
          filetypes = { "javascript", "typescript", "vue" },
        })
      end,
      ["jsonls"] = function()
        require("lspconfig")["jsonls"].setup({
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
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
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME },
              },
              diagnostics = {
                globals = { "MiniFiles", "MiniJump2d" },
              },
            },
          },
        })
      end,
    })
  end,
}
