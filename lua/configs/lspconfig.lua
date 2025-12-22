require("nvchad.configs.lspconfig").defaults()

-- lua lsp
vim.lsp.config.lua_ls = require "custom.lsp.luaLsp"
vim.lsp.enable "lua_ls"
