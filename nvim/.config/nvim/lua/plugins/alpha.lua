-- Might remove this, not sure if I love it...
local runAlpha = false

if runAlpha then
	return {
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.startify")

			alpha.setup(dashboard.opts)
		end,
	}
else
	return {}
end
