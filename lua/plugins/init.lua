return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- Database connection plugin
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup(--[[optional config]])
    end,
  },
  -- Smear cursor plugin - smooth cursor animations
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = { -- Default  Range
      stiffness = 0.8, -- 0.6      [0, 1]
      trailing_stiffness = 0.3, -- 0.4      [0, 1]
      stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
      trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
      damping = 0.8, -- 0.65     [0, 1]
      damping_insert_mode = 0.8, -- 0.7      [0, 1]
      distance_stop_animating = 0.5, -- 0.1      > 0
    },
  },
  -- test new blink
  { import = "nvchad.blink.lazyspec" },
  -- Leetcode plugin
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- configuration goes here
      lang = "python3",
    },
    lazy = false,
  },
  -- Best Markdown Preview Plugin
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup {
        glow_path = vim.fn.exepath "glow", -- explicitly find glow binary
        border = "rounded", -- floating window border config
        style = "dark", -- filled automatically with your current editor background
        pager = false,
        width = 100,
        height = 80,
        width_ratio = 0.8, -- maximum width of the Glow window compared to the nvim window size
        height_ratio = 0.8,
      }
    end,
    cmd = "Glow",
    ft = "markdown",
    keys = {
      { "<leader>mp", "<cmd>Glow<cr>", desc = "Markdown Preview" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "skim"
    end,
  },
  -- Live grep
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    version = "^1.0.0",
    config = function()
      require("telescope").load_extension "live_grep_args"
    end,
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  -- Greeter (Enhanced Alpha Dashboard)
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    config = function()
      -- Disable NvChad's dashboard first
      vim.g.nvdash_load_on_startup = false

      local alpha = require "alpha"
      local dashboard = require "alpha.themes.dashboard"

      -- Configure devicons for file icons
      local devicons = require "nvim-web-devicons"
      devicons.setup {
        override = {},
        default = true,
      }

      -- Define custom highlight groups for colors
      vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#cba6f7" }) -- Purple header (matches your tmux)

      -- Custom header with color
      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      }
      dashboard.section.header.opts.hl = "AlphaHeader"

      -- Custom buttons with dev icons from nvim-web-devicons
      dashboard.section.buttons.val = {
        dashboard.button("e", devicons.get_icon("file", "txt") .. "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("ctrl p", "⚡ Find git files", ":Telescope git_files <CR>"),
        dashboard.button("SPC l g", devicons.get_icon("git", "git") .. "  LazyGit", ":LazyGit <CR>"),
        dashboard.button(
          "SPC f h",
          devicons.get_icon("history", "log") .. "  Recently used files",
          ":Telescope oldfiles <CR>"
        ),
        dashboard.button("SPC f g", devicons.get_icon("search", "md") .. "  Find word", ":Telescope live_grep <CR>"),
        dashboard.button("SPC L", "󰐱  LeetCode", ":LeetCode <CR>"),
        dashboard.button(
          "c",
          devicons.get_icon("nvim", "lua") .. "  Configuration",
          ":e ~/.config/nvim/lua/plugins/init.lua <CR>"
        ),
        dashboard.button("q", "󰗼  Quit Neovim", ":qa<CR>"),
      }
      dashboard.config.opts.noautocmd = true
      vim.cmd [[autocmd User AlphaReady echo 'ready']]
      alpha.setup(dashboard.config)
    end,
  },
  -- LazyGit
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
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}
