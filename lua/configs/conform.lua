local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofumpt" },
    yaml = { "prettier" },
    json = { "prettier" },
    sql = { "sql_formatter" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    svelte = { "prettier" },
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
