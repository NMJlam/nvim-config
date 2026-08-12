local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_attach = require("nvchad.configs.lspconfig").on_attach

local has_blink, blink = pcall(require, "blink.cmp")
if has_blink then
  capabilities = blink.get_lsp_capabilities(capabilities)
end

return {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  cmd = {
    "/opt/homebrew/opt/llvm/bin/clangd",
    "--header-insertion=iwyu", -- Enables "Include What You Use" for auto-imports
    "--completion-style=detailed",
    "--fallback-style=LLVM",
    "--all-scopes-completion", -- suggest symbols from headers not yet included
    "--background-index", -- crawl and persist a project-wide index to disk
  },
  capabilities = capabilities,
}
