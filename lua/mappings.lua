require "nvchad.mappings"

local map = vim.keymap.set
local builtin = require("telescope.builtin")

-- default
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Oil
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Find git files
map("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- live grep
map("n", "<C-p>", builtin.git_files, { desc = "Fuzzy Finder for git files" })

-- Diagnostic
map("n", "<leader>q", vim.diagnostic.open_float, { desc = "Open diagnostic float" })

