-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local opacity = 0.8
local transparent_bg = "rgba(22, 24, 26, " .. opacity .. ")"

-- NOTE: Heavy inpso from
-- https://github.com/scottmckendry/Windots/blob/main/wezterm/wezterm.lua

--- Get the current operating system
-- @return "windows"| "linux" | "macos"
-- local function get_os()
--     local bin_format = package.cpath:match("%p[\\|/]?%p(%a+)")
--     if bin_format == "dll" then
--         return "windows"
--     elseif bin_format == "so" then
--         return "linux"
--     elseif bin_format == "dylib" then
--         return "macos"
--     end
-- end

-- local host_os = get_os()

-- Font Configuration
local emoji_font = "Segoe UI Emoji"
config.font = wezterm.font_with_fallback({
    {
        family = "Hurmit Nerd Font",
        weight = "Regular",
    },
    emoji_font,
})
config.font_size = 12

-- Color Configuration
config.colors = wezterm.get_builtin_color_schemes()['Batman']

-- Window Configuration
config.initial_rows = 45
config.initial_cols = 180
config.window_decorations = "RESIZE"
config.window_background_opacity = opacity
config.window_background_image = (os.getenv("WEZTERM_CONFIG_FILE") or ""):gsub("wezterm.lua", "bg-blurred.png")
config.window_close_confirmation = "NeverPrompt"
config.win32_system_backdrop = "Acrylic"

-- Performance Settings
config.max_fps = 144
config.animation_fps = 60
config.cursor_blink_rate = 250

-- Tab Bar Configuration
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.show_tab_index_in_tab_bar = false
config.use_fancy_tab_bar = false
config.colors.tab_bar = {
    background = transparent_bg,
    new_tab = { fg_color = config.colors.background, bg_color = config.colors.brights[6] },
    new_tab_hover = { fg_color = config.colors.background, bg_color = config.colors.foreground },
}

-- Tab Formatting
wezterm.on("format-tab-title", function(tab, _, _, _, hover)
    local background = config.colors.brights[1]
    local foreground = config.colors.foreground

    if tab.is_active then
        background = config.colors.brights[7]
        foreground = config.colors.background
    elseif hover then
        background = config.colors.brights[8]
        foreground = config.colors.background
    end

    local title = tostring(tab.tab_index + 1)
    return {
        { Foreground = { Color = background } },
        { Text = "█" },
        { Background = { Color = background } },
        { Foreground = { Color = foreground } },
        { Text = title },
        { Foreground = { Color = background } },
        { Text = "█" },
    }
end)

-- WSL stuff
config.default_domain = "WSL:Ubuntu"

-- Return the configuration to wezterm
return config
