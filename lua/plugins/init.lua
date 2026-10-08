return {
  {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require("competitest").setup {
        template_file = { cpp = vim.fn.stdpath "config" .. "/templates/template.cpp" },
        evaluate_template_modifiers = true,
      }
    end,
  },
  {
    "0xKitsune/pr.nvim",
    -- or use a local path:
    -- dir = "~/path/to/pr.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      require("pr").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    },
    opts = function()
      return require "custom.telescope_config"
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)
      telescope.load_extension "live_grep_args"
    end,
  },
  {
    "MaximilianLloyd/ascii.nvim",
    lazy = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = function()
      require "custom.smear_config"
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewFileHistory",
      "DiffviewRefresh",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      enhanced_diff_hl = true,
      view = {
        -- Use a 3-way mixed layout for merge conflicts (default is diff3_horizontal).
        merge_tool = { layout = "diff3_mixed" },
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "stevearc/oil.nvim",
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    -- Load at startup so the FileType highlight autocmd is registered before any
    -- buffer opens, and parsers install on first run.
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require "custom.treesitter_config"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "coder/claudecode.nvim",
    -- No opts: every available setting matches the plugin's defaults, and the
    -- "auto" terminal provider falls back to a native split (no snacks.nvim needed).
    config = true,
    cmd = {
      "ClaudeCode",
      "ClaudeCodeFocus",
      "ClaudeCodeSelectModel",
      "ClaudeCodeAdd",
      "ClaudeCodeSend",
      "ClaudeCodeTreeAdd",
    },
    keys = {
      -- desc starts with "claude" so every binding groups under the
      -- "Claude" header in the <leader>ch cheatsheet. (The <leader>a group
      -- label lives in mappings.lua's wk.add, so no stray cheatsheet card
      -- leaks from a nil-rhs label here.)
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "claude toggle" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "claude focus" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "claude resume" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "claude continue" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "claude select model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "claude add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "claude send selection" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "claude add file",
        ft = { "oil", "NvimTree", "neo-tree", "minifiles", "netrw" },
      },
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "claude accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "claude deny diff" },
    },
  },
}
