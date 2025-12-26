local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_init = require("nvchad.configs.lspconfig").on_init
local on_attach = require("nvchad.configs.lspconfig").on_attach

return {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  settings = {
    yaml = {
      schemas = require("schemastore").yaml.schemas(),
      schemaStore = {
        enable = false,
        url = "",
      },
      format = {
        enable = true,
      },
      validate = true,
      hover = true,
      completion = true,
    },
  },
}
