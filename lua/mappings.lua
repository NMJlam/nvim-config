require "nvchad.mappings"

local map = vim.keymap.set

-- default
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Oil
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Find git files
map("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- live grep
local builtin = require "telescope.builtin"
map("n", "<C-p>", builtin.git_files, { desc = "Fuzzy Finder for git files" })

-- Diagnostic
map("n", "<leader>q", vim.diagnostic.open_float, { desc = "Open diagnostic float" })

-- Lazy git
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit keybind" })

-- Dap
local dap = require "dap"
local dapui = require "dapui"
map("n", "<leader>dc", dap.continue, { desc = "Debug: Continue" })
map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
map("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Debug: Conditional Breakpoint" })
map("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
map("n", "<leader>do", dap.step_over, { desc = "Debug: Step Over" })
map("n", "<leader>dO", dap.step_out, { desc = "Debug: Step Out" })
map("n", "<leader>dr", dap.run_last, { desc = "Debug: Run Last" })
map("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
