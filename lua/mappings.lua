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
    { "<leader>c", group = "CompetiTest" },
    { "<leader>f", group = "Telescope" },
    { "<leader>g", group = "Diffview" },
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

-- ── competitest ───────────────────────────────────────────────
map("n", "<leader>cp", function()
  require("competitest.commands").receive "problem"
end, { desc = "competitest receive problem" })
map("n", "<leader>cc", function()
  require("competitest.commands").receive "contest"
end, { desc = "competitest receive contest" })
map("n", "<leader>ct", function()
  require("competitest.commands").receive "testcases"
end, { desc = "competitest receive testcases" })
map("n", "<leader>cr", function()
  require("competitest.commands").run_testcases(nil, true, false)
end, { desc = "competitest run testcases" })
