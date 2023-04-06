local M = {}

M.ui = {
	theme_toggle = { "tokyodark", "aye-light" },
	theme = "tokyodark",
	hl_override = {
		Visual = { -- custom highlights are also allowed
			bg = "#fffacd",
			fg = "black",
		},
	},
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
