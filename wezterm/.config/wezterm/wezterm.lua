local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	color_scheme = 'Gruvbox Dark (Gogh)',

	font = wezterm.font 'Agave Nerd Font Mono',
	font_size = 11,

	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.9,

	-- Disable ligatures
	harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },

	window_padding = {
		left = 3,
		right = 3,
		top = 1,
		bottom = 0,
	},

	inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.8,
	},

	-- background = {
	-- 	{
	-- 		source = {
	-- 			File = '/home/viet/backgrounds/gruv.jpg',
	-- 		},
	-- 		horizontal_align = "Center",
	-- 		vertical_align = "Middle",
	-- 		height = "1080",
	-- 		width = "1920",
	-- 		opacity = 0.5,
	-- 	}
	-- },
}

return config
