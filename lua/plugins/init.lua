return {
  {
    { "lcian/flowistry.nvim", ft = "rust", opts = {} },
  },
  {
    "mrcjkb/rustaceanvim",
    -- To avoid being surprised by breaking changes,
    -- I recommend you set a version range
    version = "^9",
    -- This plugin implements proper lazy-loading (see :h lua-plugin-lazy).
    -- No need for lazy.nvim to lazy-load it.
    lazy = false,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    config = function()
      require("typescript-tools").setup {}
    end,
  },
  {
    "kawre/leetcode.nvim",
    cmd = "Leet",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
      -- include a picker of your choice, see picker section for more details
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      -- configuration goes here
      lang = "cpp",
    },
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
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui" },
    config = function()
      require "custom.dap.cpp_dap"
      local dap, dapui = require "dap", require "dapui"
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  {
    "Civitasv/cmake-tools.nvim",
    ft = { "c", "cpp", "cmake" },
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {
      cmake_build_directory = "build",
      -- "lldb" reuses the adapter defined in custom.dap.cpp_dap.
      -- runInTerminal=false: the CommandLineTools lldb-dap times out on the
      -- integrated-terminal handoff. Program I/O goes to the dap console instead.
      cmake_dap_configuration = {
        type = "lldb",
        runInTerminal = false,
      },
    },
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
    opts = function()
      return require "custom.treesitter_config"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    -- Do NOT lazy-load: the plugin is already lazy internally, and deferring it
    -- only slows the first preview. It also needs to load after the colorscheme
    -- (init.lua applies base46 before plugins) so its dynamic highlight groups
    -- pick up the right colors.
    lazy = false,
    -- blink.cmp comes from nvchad.blink.lazyspec; it powers the callout/checkbox
    -- completions inside markdown buffers.
    dependencies = { "saghen/blink.cmp" },
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
