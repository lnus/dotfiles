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
config.hide_tab_bar_if_only_one_tab = true

-- Keybindings
config.keys = {
  -- Tab jumps
  { key = "phys:1", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 0 }) },
  { key = "phys:2", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 1 }) },
  { key = "phys:3", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 2 }) },
  { key = "phys:4", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 3 }) },
  { key = "phys:5", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 4 }) },
  { key = "phys:6", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 5 }) },
  { key = "phys:7", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 6 }) },
  { key = "phys:8", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 7 }) },
  { key = "phys:9", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 8 }) },
  { key = "phys:0", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTab = 9 }) },
}

-- Return the configuration to wezterm
return config
