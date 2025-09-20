require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
local builtin = require("telescope.builtin")
map("n", "<C-p>", builtin.git_files, { desc = "Fuzzy Finder for git files" })

--map <spc> + f for auto linting
map("", "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end)

--space f g for live grep
map("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

map('n', '<space>q', function() vim.diagnostic.open_float({ border = "rounded" }) end, { desc = 'Show LSP error' })

map("n", "<space>ll", ":Leet<CR>")
map("n", "<space>lr", ":Leet run<CR>")
map("n", "<space>ls", ":Leet submit<CR>")
