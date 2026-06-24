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

-- Diffview
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diffview Open" })
map("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Diffview Close" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>", { desc = "Diffview Branch History" })
map("n", "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", { desc = "Diffview Current File History" })

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

map("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "DAP Step Over" })

map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "DAP Step Into" })

map("n", "<leader>dO", function()
  require("dap").step_out()
end, { desc = "DAP Step Out" })

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
