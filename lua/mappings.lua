require "nvchad.mappings"

local map = vim.keymap.set

-- default
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
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Add a breakpoint to the line" })

map("n", "<leader>dr", function()
  require("dap").continue()
end, { desc = "Continue the debugger" })

map("n", "<leader>dt", function()
  require("dap").terminate()
end, { desc = "DAP Terminate" })

map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "DAP UI Toggle" })

map("n", "<leader>de", function()
  require("dapui").eval()
end, { desc = "DAP Eval expression" })

map("v", "<leader>de", function()
  require("dapui").eval()
end, { desc = "DAP Eval selection" })

-- open the terminal
map("n", "<leader>t", "<cmd>terminal<CR>", { desc = "Open Terminal" })
