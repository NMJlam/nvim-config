-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}
local ascii = require("ascii")

M.base46 = {
	theme = "catppuccin",
  transparency = true,
}

-- nv dash greeter
M.nvdash = { load_on_startup = true,
              header = ascii.art.text.neovim.sharp
}
M.ui = {
   telescope = { style = "bordered" }, -- borderless / bordered
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
