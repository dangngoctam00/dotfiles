-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Gruvbox Dark (Gogh)'
config.font = wezterm.font 'Fira Code'
config.font_size = 20.0
config.initial_cols = 120
config.initial_rows = 40

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():set_inner_size(1700, 800)
  window:gui_window():set_position(600, 300)
  -- pane:split { size = 0.5 }  -- split 2 pane
end)

-- and finally, return the configuration to wezterm
return config