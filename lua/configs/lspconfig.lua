require("nvchad.configs.lspconfig").defaults()

local lsp = vim.lsp

-- lua lsp
lsp.config.lua_ls = require "custom.lsp.luaLsp"
lsp.enable "lua_ls"

-- go lsp
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin:" .. vim.env.PATH
lsp.config.gopls = require "custom.lsp.goLsp"
lsp.enable "gopls"
