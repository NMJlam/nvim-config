local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_attach = require("nvchad.configs.lspconfig").on_attach

return {
  cmd = { "neocmakelsp", "stdio" },
  filetypes = { "cmake" },
  root_markers = { "CMakeLists.txt", "cmake", ".git" },
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    buildDirectory = "build",
  },
}
