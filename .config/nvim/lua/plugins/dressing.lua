return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    select = {
      get_config = function(opts)
        if opts.kind == "codeaction" then
          return {
            backend = "builtin",
            builtin = {
              relative = "cursor",
              min_height = { 0, 0 },
              override = function(conf)
                conf.row = 1
                return conf
              end,
            },
            format_item_override = {
              codeaction = function(action_tuple)
                local title = action_tuple[2].title:gsub("\r\n", "\\r\\n")
                local client = vim.lsp.get_client_by_id(action_tuple[1])
                return string.format("%s [%s]", title:gsub("\n", "\\n"), client.name)
              end,
            },
          }
        end
      end,
    },
  },
}
