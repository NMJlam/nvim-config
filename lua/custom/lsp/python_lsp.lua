local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_init = require("nvchad.configs.lspconfig").on_init
local on_attach = require("nvchad.configs.lspconfig").on_attach

return {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  -- Root at the nearest marker; fall back to cwd like VS Code treats an opened folder.
  root_dir = function(bufnr, on_dir)
    local markers = {
      "pyproject.toml", "setup.py", "setup.cfg",
      "requirements.txt", "Pipfile", "pyrightconfig.json", ".git",
    }
    local fname = vim.api.nvim_buf_get_name(bufnr)
    on_dir(vim.fs.root(fname, markers) or vim.fn.getcwd())
  end,

  settings = {
    pyright = {
      disableOrganizeImports = false,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
        typeCheckingMode = "basic",
        diagnosticSeverityOverrides = {
          reportUnusedImport = "warning",
        },
      },
    },
  },
}
