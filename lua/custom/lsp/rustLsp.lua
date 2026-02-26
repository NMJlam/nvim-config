local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_init = require("nvchad.configs.lspconfig").on_init
local on_attach = require("nvchad.configs.lspconfig").on_attach

return {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = true,
      procMacro = {
        enable = true,
      },
      inlayHints = {
        enabled = { enable = true },
        parameterHints = { enable = true },
        typeHints = { enable = true },
      },
    },
  },
}
