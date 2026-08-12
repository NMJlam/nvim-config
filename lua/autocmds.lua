require "nvchad.autocmds"

-- Auto-insert an #include for the matching header when an empty C++ source
-- file is opened (e.g. new `foo.cpp` -> `#include "foo.h"`). Works no matter
-- how the file was created (oil.nvim, :e, telescope, ...).
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  pattern = { "*.cpp", "*.cc", "*.cxx" },
  group = vim.api.nvim_create_augroup("cpp_header_include", { clear = true }),
  callback = function(args)
    -- Bail unless the buffer is completely empty.
    local lines = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)
    if #lines > 1 or (lines[1] and lines[1] ~= "") then
      return
    end

    local dir = vim.fn.fnamemodify(args.file, ":h")
    local stem = vim.fn.fnamemodify(args.file, ":t:r") -- filename without extension

    -- Prefer a header that already exists next to the source file.
    local header
    for _, ext in ipairs { "h", "hpp", "hh", "hxx" } do
      if vim.fn.filereadable(dir .. "/" .. stem .. "." .. ext) == 1 then
        header = stem .. "." .. ext
        break
      end
    end
    header = header or (stem .. ".h") -- fall back to .h if none exists yet

    vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, {
      string.format('#include "%s"', header),
      "",
    })
  end,
})
