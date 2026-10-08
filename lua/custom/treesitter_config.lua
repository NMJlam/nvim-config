-- nvim-treesitter `main` branch config.
--
-- The `main` branch (required for Neovim 0.11+/0.12; `master` is archived and
-- crashes on 0.12) does NOT read an `ensure_installed`/`highlight` table like the
-- legacy `master` branch did. Instead:
--   * parsers are installed via `require("nvim-treesitter").install(...)`
--   * highlighting is Neovim-native, enabled per-buffer with `vim.treesitter.start()`

local ensure_installed = {
  "vim",
  "lua",
  "vimdoc",
  "html",
  "css",
  "go",
  "gomod",
  "gosum",
  "gotmpl",
  "gowork",
  "json",
  "yaml",
  "sql",
  "svelte",
  "rust",
  "python",
  "javascript",
  "typescript",
  "tsx",
  "markdown",
  "markdown_inline",
}

require("nvim-treesitter").install(ensure_installed)

-- Enable treesitter highlighting for any buffer whose filetype maps to an
-- installed parser. `language.add` returns false (instead of erroring) when the
-- parser isn't available, so unknown/uninstalled filetypes are skipped cleanly.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("custom_treesitter_highlight", { clear = true }),
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
    if lang and vim.treesitter.language.add(lang) then
      vim.treesitter.start(ev.buf, lang)
    end
  end,
})
