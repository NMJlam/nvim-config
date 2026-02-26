local on_attach = require("nvchad.configs.lspconfig").on_attach

require("typescript-tools").setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)

    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.cmd "TSToolsOrganizeImports sync"
      end,
    })
  end,
}
