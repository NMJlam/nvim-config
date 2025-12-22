return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { 
          "nvim-telescope/telescope-live-grep-args.nvim" ,
          -- This will not install any breaking changes.
          -- For major updates, this must be adjusted manually.
          version = "^1.0.0",
      },
    },
    opts = function()
      return require("custom.telescope_config")
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("live_grep_args")
    end
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
    event = 'BufWritePre', -- uncomment for format on save
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
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  }
}
