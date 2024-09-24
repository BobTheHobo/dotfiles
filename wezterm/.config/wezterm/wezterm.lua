local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	color_scheme = 'Gruvbox Dark (Gogh)',

	font = wezterm.font 'Agave Nerd Font Mono',
	font_size = 11,

	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.5,

	-- Disable ligatures
	harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },

	window_padding = {
		left = 3,
		right = 3,
		top = 1,
		bottom = 0,
	}
}

return config
