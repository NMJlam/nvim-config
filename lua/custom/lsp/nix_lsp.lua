local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_attach = require("nvchad.configs.lspconfig").on_attach

-- nixd/nixfmt aren't in mason for macOS; install them via nix-darwin
-- (environment.systemPackages = [ pkgs.nixd pkgs.nixfmt ]).
local homelab = 'builtins.getFlake "/Users/nlam/Repositories/flake"'
local darwin = 'builtins.getFlake "/private/etc/nix-darwin"'

return {
  cmd = { "nixd" },
  filetypes = { "nix" },
  root_markers = { "flake.nix", ".git" },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    nixd = {
      nixpkgs = { expr = "import (" .. homelab .. ").inputs.nixpkgs { }" },
      options = {
        nixos = { expr = "(" .. homelab .. ").nixosConfigurations.homelab.options" },
        nix_darwin = { expr = "(" .. darwin .. ').darwinConfigurations."macbook".options' },
      },
    },
  },
}
