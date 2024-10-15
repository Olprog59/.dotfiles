local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {

	automatically_reload_config = true,
	-- enable_tab_bar = true,
	send_composed_key_when_left_alt_is_pressed = true,
	adjust_window_size_when_changing_font_size = false,
	initial_cols = 200,
	initial_rows = 60,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	default_cursor_style = "BlinkingBlock",
	color_scheme = "Catppuccin Mocha",
	font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	font_size = 14,

	check_for_updates = true,
	check_for_updates_interval_seconds = 86400,
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
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	},
	window_background_opacity = 0.90,
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

wezterm.on("update-right-status", function(window, pane)
	-- Each element holds the text for a cell in a "powerline" style << fade
	local cells = {}

	-- Figure out the cwd and host of the current pane.
	-- This will pick up the hostname for the remote host if your
	-- shell is using OSC 7 on the remote host.
	local cwd_uri = pane:get_current_working_dir()
	if cwd_uri then
		local cwd = ""
		local hostname = ""

		if type(cwd_uri) == "userdata" then
			-- Running on a newer version of wezterm and we have
			-- a URL object here, making this simple!

			cwd = cwd_uri.file_path
			hostname = cwd_uri.host or wezterm.hostname()
		else
			-- an older version of wezterm, 20230712-072601-f4abf8fd or earlier,
			-- which doesn't have the Url object
			cwd_uri = cwd_uri:sub(8)
			local slash = cwd_uri:find("/")
			if slash then
				hostname = cwd_uri:sub(1, slash - 1)
				-- and extract the cwd from the uri, decoding %-encoding
				cwd = cwd_uri:sub(slash):gsub("%%(%x%x)", function(hex)
					return string.char(tonumber(hex, 16))
				end)
			end
		end

		-- Remove the domain name portion of the hostname
		local dot = hostname:find("[.]")
		if dot then
			hostname = hostname:sub(1, dot - 1)
		end
		if hostname == "" then
			hostname = wezterm.hostname()
		end

		table.insert(cells, cwd)
		table.insert(cells, hostname)
	end

	-- I like my date/time in this style: "Wed Mar 3 08:14"
	local date = wezterm.strftime("%a %-d %b %H:%M:%S")
	table.insert(cells, date)

	-- An entry for each battery (typically 0 or 1 battery)
	for _, b in ipairs(wezterm.battery_info()) do
		if b.state == "Empty" then
			break
		end

		-- table.insert(cells, b.state)
		table.insert(cells, string.format("%.0f%%", b.state_of_charge * 100))
	end

	-- The powerline < symbol
	local LEFT_ARROW = utf8.char(0xe0b3)
	-- The filled in variant of the < symbol
	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

	-- Color palette for the backgrounds of each cell
	local colors = {
		"#3c1361",
		"#52307c",
		"#663a82",
		"#7c5295",
		"#b491c8",
	}

	-- Foreground color for the text across the fade
	local text_fg = "#c0c0c0"

	-- The elements to be formatted
	local elements = {}
	-- How many cells have been formatted
	local num_cells = 0

	-- Translate a cell into elements
	function push(text, is_last)
		local cell_no = num_cells + 1
		table.insert(elements, { Foreground = { Color = text_fg } })
		table.insert(elements, { Background = { Color = colors[cell_no] } })
		table.insert(elements, { Text = " " .. text .. " " })
		if not is_last then
			table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
			table.insert(elements, { Text = SOLID_LEFT_ARROW })
		end
		num_cells = num_cells + 1
	end

	while #cells > 0 do
		local cell = table.remove(cells, 1)
		push(cell, #cells == 0)
	end

	window:set_right_status(wezterm.format(elements))
end)

return config
