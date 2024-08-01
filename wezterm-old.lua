local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

config.keys = {
	-- This will create a new split and run your default program inside it
	{
		key = "d",
		mods = "ALT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "s",
		mods = "ALT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- This will close window
	{
		key = "x",
		mods = "ALT",
		action = act.CloseCurrentPane({ confirm = false }),
	},
	-- This opens new tab
	{
		key = "n",
		mods = "ALT",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	-- This lets you move between windows
	{
		key = "h",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Down"),
	},
	-- Move between tabs
	{
		key = "j",
		mods = "CTRL|ALT",
		action = act.ActivateTabRelativeNoWrap(-1),
	},
	{
		key = "k",
		mods = "CTRL|ALT",
		action = act.ActivateTabRelativeNoWrap(1),
	},
	-- Scroll up and down page
	{
		key = "PageUp",
		mods = "SHIFT",
		action = act.ScrollByPage(-1),
	},
	{
		key = "PageDown",
		mods = "SHIFT",
		action = act.ScrollByPage(1),
	},
	-- ToggleFullScreen
	{
		key = "f",
		mods = "CMD",
		action = wezterm.action.ToggleFullScreen,
	},
	-- Go back to original font size
	{
		key = "0",
		mods = "CTRL",
		action = wezterm.action.ResetFontSize,
	},
	-- Change Font size
	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action.DecreaseFontSize,
	},
	{
		key = "=",
		mods = "CTRL",
		action = wezterm.action.IncreaseFontSize,
	},
	{
		key = "<",
		mods = "CMD|SHIFT",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.font_size = 17
config.color_scheme = "Nightfly (Gogh)"
config.default_cursor_style = "SteadyBar"
config.window_decorations = "RESIZE"
config.animation_fps = 60
config.scrollback_lines = 90000
config.adjust_window_size_when_changing_font_size = false
config.initial_rows = 62
config.initial_cols = 200
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.93

return config
