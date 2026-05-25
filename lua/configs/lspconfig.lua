require("nvchad.configs.lspconfig").defaults()

local lsp = vim.lsp

-- lua lsp
lsp.config.lua_ls = require "custom.lsp.lua_lsp"
lsp.enable "lua_ls"

-- Cpp lsp
lsp.config.clangd = require "custom.lsp.cpp_lsp"
lsp.enable "clangd"
