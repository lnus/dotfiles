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
  -- Window management

  -- S/V to split vertically/horizontally
  { key = "S", mods = "CTRL", action = wezterm.action{
      SplitHorizontal={domain="CurrentPaneDomain"}
  } },
  { key = "V", mods = "CTRL", action = wezterm.action{
      SplitVertical={domain="CurrentPaneDomain"}
  } },

  -- H/J/K/L to move between panes
  { key = "H", mods = "CTRL", action = wezterm.action{
      ActivatePaneDirection="Left"
  } },
  { key = "J", mods = "CTRL", action = wezterm.action{
      ActivatePaneDirection="Down"
  } },
  { key = "K", mods = "CTRL", action = wezterm.action{
      ActivatePaneDirection="Up"
  } },
  { key = "L", mods = "CTRL", action = wezterm.action{
      ActivatePaneDirection="Right"
  } },

  -- Arrow keys to move between panes
  { key = "LeftArrow", mods = "CTRL", action = wezterm.action{
      ActivatePaneDirection="Left"
  } },
  { key = "DownArrow", mods = "CTRL", action = wezterm.action{
      ActivatePaneDirection="Down"
  } },
  { key = "UpArrow", mods = "CTRL", action = wezterm.action{
      ActivatePaneDirection="Up"
  } },
  { key = "RightArrow", mods = "CTRL", action = wezterm.action{
      ActivatePaneDirection="Right"
  } },

  -- Q to close pane
  { key = "Q", mods = "CTRL", action = wezterm.action{
      CloseCurrentPane={confirm=true}
  } },

  -- T to open new tab
  { key = "T", mods = "CTRL", action = wezterm.action{
      SpawnTab="CurrentPaneDomain"
  } },

  -- Left/Right to rotate panes left and right
  { key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action{
      RotatePanes ="CounterClockwise"
  } },
  { key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action{
      RotatePanes ="Clockwise"
  } },


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
