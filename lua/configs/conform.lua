local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofumpt" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    rust = { "rustfmt" },
    python = { "ruff_format" },
    cpp = { "clang-format" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  formatters = {
    sql_formatter = {
      prepend_args = { "-l", "postgresql" },
    },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
