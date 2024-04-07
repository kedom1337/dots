return {
  "williamboman/mason-lspconfig.nvim",
  event = "BufReadPre",
  keys = {
    { "K", "<cmd> lua vim.lsp.buf.hover() <cr>", desc = "Lsp hover" },
    { "gr", "<cmd> lua vim.lsp.buf.references() <cr>", desc = "Lsp references" },
    { "gi", "<cmd> lua vim.lsp.buf.implementation() <cr>", desc = "Lsp implementation" },
    { "gd", "<cmd> lua vim.lsp.buf.definition() <cr>", desc = "Lsp definition" },
    { "gD", "<cmd> lua vim.lsp.buf.declaration() <cr>", desc = "Lsp declaration" },
    { "<leader>s", "<cmd> lua vim.lsp.buf.signature_help() <cr>", desc = "Lsp signature_help" },
    { "<leader>ra", "<cmd> lua vim.lsp.buf.rename() <cr>", desc = "Lsp rename" },
    { "<leader>ca", "<cmd> lua vim.lsp.buf.code_action() <cr>", desc = "Lsp code_action" },
    { "<leader>d", "<cmd> lua vim.diagnostic.open_float() <cr>", desc = "Opens current diagnostic" },
    { "<C-Up>", "<cmd> lua vim.diagnostic.goto_prev() <cr>", desc = "Jump to previous diagnostic" },
    { "<C-Down>", "<cmd> lua vim.diagnostic.goto_next() <cr>", desc = "Jump to next diagnostic" },
    { "<leader>M", "<cmd> Mason <cr>", desc = "Open package manager" },
  },
  config = function()
    local lsp = require("mason-lspconfig")

    vim.diagnostic.config({
      severity_sort = true,
      float = { border = "rounded", focusable = false },
    })

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    local function on_attach(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
        vim.wo.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
      end
    end

    local gopts = { on_attach = on_attach }

    lsp.setup({
      automatic_installation = true,
      ensure_installed = { "lua_ls" },
    })

    lsp.setup_handlers({
      function(server_name)
        local ok, opts = pcall(require, "plugins.lsp." .. server_name)
        if ok then
          opts = vim.tbl_deep_extend("force", {}, gopts, opts)
        else
          opts = gopts
        end

        require("lspconfig")[server_name].setup(opts)
      end,
      ["rust_analyzer"] = function() end,
    })

    vim.g.rustaceanvim = {
      server = {
        on_attach = on_attach,
      },
    }
  end,
}
