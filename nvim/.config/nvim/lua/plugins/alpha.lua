-- Might remove this, not sure if I love it...

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
