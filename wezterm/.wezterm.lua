-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Colorscheme
config.color_scheme = '3024 (base16)'

-- Tab bar
config.enable_tab_bar = true
config.tab_bar_at_bottom = true

-- Return the configuration to wezterm
return config
