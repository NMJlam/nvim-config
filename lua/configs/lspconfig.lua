require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "gopls"}
-- Add lsp from mason to make them load 
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
