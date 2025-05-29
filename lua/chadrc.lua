-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 
---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "github_dark",
	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
		-- Your transparent background overrides
		Normal = { bg = "NONE", ctermbg = "NONE" },
		NormalFloat = { bg = "NONE", ctermbg = "NONE" },
		CursorLine = { bg = "#444444", ctermbg = 233 },
		NormalNC = { bg = "NONE", ctermbg = "NONE" },
		WinSeparator = { bg = "NONE", ctermbg = "NONE" },
		LineNr = { bg = "NONE", ctermbg = "NONE" },
		SignColumn = { bg = "NONE", ctermbg = "NONE" },
		EndOfBuffer = { bg = "NONE", ctermbg = "NONE" },
	},
}

-- M.nvdash = { load_on_startup = true }

M.ui = {
	tabufline = {
		lazyload = false
	}
}

return M
