return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    panel = {
      enabled = false,
    },
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = "<M-CR>",
      },
    },
  },
}
