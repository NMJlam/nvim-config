require "nvchad.mappings"

local map = vim.keymap.set

-- ╭──────────────────────────────────────────────────────────────────╮
-- │ Cheatsheet (<leader>ch) categorisation                            │
-- │                                                                    │
-- │ NvChad groups keymaps in the cheatsheet by the FIRST WORD of the   │
-- │ `desc`, and silently drops any desc that is a single word. So      │
-- │ every desc reads "<plugin> <what it does>" — the first word is the │
-- │ associated plugin, which becomes the cheatsheet header.            │
-- ╰──────────────────────────────────────────────────────────────────╯

-- which-key group labels (the <leader> popup; separate from the cheatsheet)
local ok, wk = pcall(require, "which-key")
if ok then
  wk.add {
    { "<leader>a", group = "Claude" },
    { "<leader>f", group = "Telescope" },
    { "<leader>g", group = "Diffview" },
    { "<leader>d", group = "Dap" },
  }
end

-- NvChad's cheatsheet appends the mode to non-normal headers (e.g. a visual
-- map lands under "Claude (v)" instead of "Claude"). Fold those mode-suffixed
-- cards back into their base header so each plugin gets a single card.
local cs_ok, cheatsheet = pcall(require, "nvchad.cheatsheet")
if cs_ok and not cheatsheet._fold_modes_patched then
  local organize = cheatsheet.organize_mappings
  cheatsheet.organize_mappings = function(...)
    local grouped = organize(...)
    local merged = {}
    for header, maps in pairs(grouped) do
      local base = header:gsub("%s%(%a+%)$", "") -- strip trailing " (v)/(i)/(x)/(t)"
      merged[base] = merged[base] or {}
      vim.list_extend(merged[base], maps)
    end
    return merged
  end
  cheatsheet._fold_modes_patched = true
end

-- ── general ───────────────────────────────────────────────────
map("i", "jk", "<ESC>", { desc = "general exit insert mode" })
map("n", "<leader>t", "<cmd>terminal<CR>", { desc = "general open terminal" })

-- ── oil ───────────────────────────────────────────────────────
map("n", "-", "<CMD>Oil<CR>", { desc = "oil open parent dir" })

-- ── telescope ─────────────────────────────────────────────────
local builtin = require "telescope.builtin"
map("n", "<C-p>", builtin.git_files, { desc = "telescope find git files" })
map("n", "<leader>fg", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "telescope live grep" })

-- ── diagnostic ────────────────────────────────────────────────
map("n", "<leader>q", vim.diagnostic.open_float, { desc = "diagnostic open float" })

-- ── lazygit ───────────────────────────────────────────────────
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "lazygit open" })

-- ── diffview ──────────────────────────────────────────────────
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "diffview open" })
map("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "diffview close" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>", { desc = "diffview branch history" })
map("n", "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", { desc = "diffview file history" })

-- ── dap ───────────────────────────────────────────────────────
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "dap toggle breakpoint" })

map("n", "<leader>dr", function()
  require("dap").continue()
end, { desc = "dap continue / start" })

map("n", "<leader>dt", function()
  require("dap").terminate()
end, { desc = "dap terminate" })

map("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "dap step over" })

map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "dap step into" })

map("n", "<leader>dO", function()
  require("dap").step_out()
end, { desc = "dap step out" })

-- ── dap (dap-ui lives under the same "dap" header) ────────────
map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "dap toggle ui" })

map("n", "<leader>de", function()
  require("dapui").eval()
end, { desc = "dap eval expression" })

map("v", "<leader>de", function()
  require("dapui").eval()
end, { desc = "dap eval selection" })
