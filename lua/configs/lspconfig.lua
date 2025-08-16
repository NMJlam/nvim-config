
require("nvchad.configs.lspconfig").defaults()

local servers = {
  "gopls",
  "ruff",
  "cssls",
  "eslint",
  "html",
  "lua_ls",
  "pyright",
  "rust_analyzer",
  "tailwindcss",
  "ts_ls"
}
vim.lsp.enable(servers)

-- EXAMPLE
require('mason-lspconfig').setup({
    ensure_installed = servers, -- Add your desired servers here
})
