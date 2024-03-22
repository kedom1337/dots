return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
  },
  keys = {
    { "<leader>?", "<Cmd> lua require('dapui').toggle() <Cr>", desc = "Jump to previous diagnostic" },
    { "<F5>", "<Cmd> lua require('dap').continue() <Cr>", desc = "Dap continue" },
    { "<C-F5>", "<Cmd> lua require('dap').run_last() <Cr>", desc = "Dap re-run last debug session" },
    { "<S-F5>", "<Cmd> lua require('dap').terminate() <Cr>", desc = "Dap terminate" },
    { "<M-Del>", "<Cmd> lua require('dap').pause() <Cr>", desc = "Dap pause" },
    { "<F7>", "<Cmd> lua require('dap').run_to_cursor() <Cr>", desc = "Dap run to cursor" },
    { "<F9>", "<Cmd> lua require('dap').toggle_breakpoint() <Cr>", desc = "Dap toggle breakpoint on current line" },
    { "<F10>", "<Cmd> lua require('dap').step_over() <Cr>", desc = "Dap step over" },
    { "<F11>", "<Cmd> lua require('dap').step_into() <Cr>", desc = "Dap step into" },
    { "<S-F11>", "<Cmd> lua require('dap').step_out() <Cr>", desc = "Dap step out" },
  },
  config = function()
    local dap = require("dap")
    local dap_ui = require("dapui")

    local sign = vim.fn.sign_define
    sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

    dap_ui.setup()

    dap.listeners.after.event_initialized["dap_ui_config"] = function()
      dap_ui.open()
    end
  end,
}
