require("nvchad.configs.lspconfig").defaults()

local lsp = vim.lsp

-- lua lsp
lsp.config.lua_ls = require "custom.lsp.luaLsp"
lsp.enable "lua_ls"

-- go lsp
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin:" .. vim.env.PATH
lsp.config.gopls = require "custom.lsp.goLsp"
lsp.enable "gopls"

-- json lsp
lsp.config.jsonls = require "custom.lsp.jsonLsp"
lsp.enable "jsonls"

-- yaml lsp
lsp.config.yamlls = require "custom.lsp.yamlLsp"
lsp.enable "yamlls"

-- postgres lsp (using sqls)
lsp.config.postgres_language_server = require "custom.lsp.postgresLsp"
lsp.enable "postgres_language_server"
