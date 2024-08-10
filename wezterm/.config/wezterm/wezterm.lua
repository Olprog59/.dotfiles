local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {

	automatically_reload_config = true,
	-- enable_tab_bar = false,
	send_composed_key_when_left_alt_is_pressed = true,
	adjust_window_size_when_changing_font_size = false,
	initial_cols = 200,
	initial_rows = 60,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	default_cursor_style = "BlinkingBlock",
	color_scheme = "Nord (Gogh)",
	font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	font_size = 12.5,
	-- background = {
	-- 	{
	-- 		source = {
	-- 			File = "/Users/olprog/.config/kitty/warp_bg.png",
	-- 		},
	-- 		hsb = {
	-- 			hue = 0.0,
	-- 			saturation = 1.02,
	-- 			brightness = 0.25,
	-- 		},
	-- 		width = "100%",
	-- 		height = "100%",
	-- 	},
	-- 	{
	-- 		source = {
	-- 			Color = "#282c35",
	-- 		},
	-- 		width = "100%",
	-- 		height = "100%",
	-- 		opacity = 0.55,
	-- 	},
	-- },
	window_padding = {
		left = 2,
		right = 2,
		top = 2,
		bottom = 2,
	},
	window_background_opacity = 0.85,
	macos_window_background_blur = 20,
	-- leader = { key = "s", mods = "CTRL" },
	hide_tab_bar_if_only_one_tab = true,
	-- keys = {
	-- 	{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
	-- 	{ key = "-", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	-- 	{ key = "$", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	-- 	{ key = "s", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	-- 	{ key = "v", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	-- 	{ key = "m", mods = "LEADER", action = "TogglePaneZoomState" },
	-- 	{ key = ",", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	-- 	{ key = "h", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	-- 	{ key = "j", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	-- 	{ key = "k", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	-- 	{ key = "l", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	-- 	{ key = "h", mods = "LEADER|CTRL", action = wezterm.action({ AdjustPaneSize = { "Left", 10 } }) },
	-- 	{ key = "j", mods = "LEADER|CTRL", action = wezterm.action({ AdjustPaneSize = { "Down", 10 } }) },
	-- 	{ key = "k", mods = "LEADER|CTRL", action = wezterm.action({ AdjustPaneSize = { "Up", 10 } }) },
	-- 	{ key = "l", mods = "LEADER|CTRL", action = wezterm.action({ AdjustPaneSize = { "Right", 10 } }) },
	-- 	{ key = "Tab", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = 1 }) },
	-- 	{ key = "Tab", mods = "LEADER|SHIFT", action = wezterm.action({ ActivateTabRelative = -1 }) },
	-- 	{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
	-- 	{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
	-- 	{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
	-- 	{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
	-- 	{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
	-- 	{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
	-- 	{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
	-- 	{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
	-- 	{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
	-- 	{ key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
	-- 	{ key = "d", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	-- 	{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	-- 	{
	-- 		key = "L",
	-- 		mods = "OPT|SHIFT",
	-- 		action = wezterm.action({ SendString = "|" }),
	-- 	},
	-- },
}

return config
