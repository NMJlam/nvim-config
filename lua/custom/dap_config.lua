local dap = require "dap"
local dapui = require "dapui"

-- Setup DAP UI
dapui.setup {
  icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
  controls = {
    icons = {
      pause = "⏸",
      play = "▶",
      step_into = "⏎",
      step_over = "⏭",
      step_out = "⏮",
      step_back = "b",
      run_last = "▶▶",
      terminate = "⏹",
      disconnect = "⏏",
    },
  },
}

-- Auto-open/close DAP UI when debugging starts/stops
dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

-- Setup virtual text (shows variable values inline)
require("nvim-dap-virtual-text").setup()

-- Setup Go debugging with Delve
require("dap-go").setup {
  delve = {
    path = vim.fn.stdpath "data" .. "/mason/bin/dlv",
  },
}
