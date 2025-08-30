
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
  "ts_ls",
  "hls",
}
vim.lsp.enable(servers)

-- EXAMPLE
require('mason-lspconfig').setup({
    ensure_installed = servers, -- Add your desired servers here
})

-- In your configs/lspconfig.lua - add this AFTER your existing setup
-- require('lspconfig').jdtls.setup({}) NOTE: nvim-java does not work with mason 2.0
