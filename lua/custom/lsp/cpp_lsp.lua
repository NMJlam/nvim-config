local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_attach = require("nvchad.configs.lspconfig").on_attach

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
  },
  capabilities = capabilities,
}
