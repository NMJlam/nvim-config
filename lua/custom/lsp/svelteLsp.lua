local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_init = require("nvchad.configs.lspconfig").on_init
local on_attach = require("nvchad.configs.lspconfig").on_attach

return {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)

    -- Auto-import: organize imports on save (same as your tsLsp.lua)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.code_action {
          context = { only = { "source.organizeImports" }, diagnostics = {} },
          apply = true,
        }
      end,
    })
  end,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "svelteserver", "--stdio" },
  filetypes = { "svelte" },
}
