local wezterm = require("wezterm")
local scheme = wezterm.get_builtin_color_schemes()["nord"]
local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end
-- Setting
--config.color_scheme = "nord"
--config.cursor_blink_rate = 30
--config.cursor_blink_ease_in = "Linear"
--config.default_cursor_style = "BlinkingBlock" -- SteadyBlock, BlinkingBlock, SteadyUnderline, BlinkingUnderline, SteadyBar, and BlinkingBar.
--config.animation_fps = 30
--config.cursor_blink_ease_in = "Constant"
--config.cursor_blink_ease_out = "Constant"
-- Set the cursor style to a blinking block
config.cursor_blink_ease_in = "EaseIn"
config.cursor_blink_ease_out = "EaseOut"
config.default_cursor_style = "BlinkingBlock" -- BlinkingBar
config.cursor_blink_rate = 100 -- Adjust the blink rate in milliseconds
--config.default_cursor_style = "BlinkingUnderline"

config.font = wezterm.font("VictorMono Nerd Font Propo", { weight = "Bold", italic = false })
config.font_size = 13
config.line_height = 1.0
config.enable_scroll_bar = true
-- Window management
--
config.window_decorations = "NONE" --"RESIZE"
config.window_background_opacity = 1.0
config.audible_bell = "Disabled" -- SystemBeep

config.window_close_confirmation = "AlwaysPrompt" --"NeverPrompt" --"AlwaysPrompt"
config.window_padding = {
	left = 10,
	right = 2,
	top = 5,
	bottom = 5,
}

config.scrollback_lines = 10000
config.default_workspace = "home"
-- Tab configurations
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- pane configurations
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.6,
}

-- wezterm general configs
config.check_for_updates = false
config.use_ime = true
config.ime_preedit_rendering = "Builtin"
config.use_dead_keys = false
config.warn_about_missing_glyphs = false

-- Color theme
config.color_scheme_dirs = { "/home/mdotgh/.config/colors/" }
config.color_scheme = "github_dimmed"
config.colors = {
	tab_bar = {
		background = "#2d333b", --scheme.background,
		new_tab = { bg_color = "#2d333b", fg_color = scheme.ansi[8], intensity = "Bold" },
		new_tab_hover = { bg_color = scheme.ansi[1], fg_color = scheme.brights[8], intensity = "Bold" },
		-- format-tab-title
		-- active_tab = { bg_color = "#121212", fg_color = "#FCE8C3" },
		-- inactive_tab = { bg_color = scheme.background, fg_color = "#FCE8C3" },
		-- inactive_tab_hover = { bg_color = scheme.ansi[1], fg_color = "#FCE8C3" },
	},
}

-- key config
-- timeout_milliseconds defaults to 1000 and can be omitted
-- This will be triggered when click Ctrl + a

--config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.leader = { key = "Space", mods = "CTRL|SHIFT" }
config.keys = {
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
	{
		key = "a",
		mods = "LEADER|CTRL",
		action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
	},

	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
	{ key = "[", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Next") },
	{ key = "]", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Prev") },
	{ key = "+", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	{ key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },
	{ key = "b", mods = "CMD", action = wezterm.action.SendString("\x02") },
	{ key = "c", mods = "CMD|SHIFT", action = wezterm.action.ActivateCopyMode },
	{ key = "p", mods = "CMD", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "c", mods = "CMD", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
	-- copy and paste
	{ key = "v", mods = "CMD", action = wezterm.action.PasteFrom("Clipboard") },
	-- paste from the primary selection
	{ key = "V", mods = "CMD", action = wezterm.action.PasteFrom("PrimarySelection") },

	{
		key = "h",
		mods = "CMD|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "j",
		mods = "CMD|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "k", mods = "CMD|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "l",
		mods = "CMD|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{ key = "r", mods = "CMD|SHIFT", action = wezterm.action.ActivateWindowRelative(1) },
}

config.enable_wayland = true
-- ###########################################
--           Supporting open windows
--             mazimized at startup
-- https://github.com/wez/wezterm/issues/284
-- ###########################################
local mux = wezterm.mux

-- Set the window to open maximized
wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)
return config
