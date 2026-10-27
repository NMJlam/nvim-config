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
    -- Apple clangd: Homebrew's clangd 22 mis-parses GNU libstdc++ headers in
    -- C++20 mode ("unknown type name '__darwin_wint_t'"), which breaks
    -- <bits/stdc++.h>. Apple's clangd 21 handles them correctly.
    "/usr/bin/clangd",
    "--header-insertion=iwyu", -- Enables "Include What You Use" for auto-imports
    "--completion-style=detailed",
    "--fallback-style=LLVM",
    "--all-scopes-completion", -- suggest symbols from headers not yet included
    "--background-index", -- crawl and persist a project-wide index to disk
    -- Allow clangd to query the GNU g++ driver for its system include paths
    -- (needed to find <bits/stdc++.h> and libstdc++). Compiler is pinned in
    -- competitive_programming/.clangd (per-project, so C files are unaffected).
    "--query-driver=/opt/homebrew/bin/g++-16",
  },
  capabilities = capabilities,
}
