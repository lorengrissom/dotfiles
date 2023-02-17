local wezterm = require 'wezterm'
local act = wezterm.action

return {
  keys = {
    -- This will create a new split and run your default program inside it
    {
      key = 'd',
      mods = 'ALT',
      action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 's',
      mods = 'ALT',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    -- This will close window
    {
      key = 'x',
      mods = 'ALT',
      action = act.CloseCurrentPane { confirm = false },
    },
    -- This opens new tab
    {
      key = 'n',
      mods = 'ALT',
      action = act.SpawnTab 'CurrentPaneDomain',
    },
    -- This lets you move between windows
    {
      key = 'h',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Left',
    },
    {
      key = 'l',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Right',
    },
    {
      key = 'k',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Up',
    },
    {
      key = 'j',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Down',
    },
    -- Move between tabs
    {
      key = 'j',
      mods = 'CTRL|ALT',
      action = act.ActivateTabRelativeNoWrap( -1)
    },
    {
      key = 'k',
      mods = 'CTRL|ALT',
      action = act.ActivateTabRelativeNoWrap(1)
    },
    -- Scroll up and down page
    {
      key = 'PageUp',
      mods = 'SHIFT',
      action = act.ScrollByPage( -1)
    },
    {
      key = 'PageDown',
      mods = 'SHIFT',
      action = act.ScrollByPage(1)
    },
    -- ToggleFullScreen
    {
      key = 'f',
      mods = 'CMD',
      action = wezterm.action.ToggleFullScreen,
    },
    -- Go back to original font size
    {
      key = '0',
      mods = 'CTRL',
      action = wezterm.action.ResetFontSize,
    },
    -- Change Font size
    {
      key = '-',
      mods = 'CTRL',
      action = wezterm.action.DecreaseFontSize,
    },
    {
      key = '=',
      mods = 'CTRL',
      action = wezterm.action.IncreaseFontSize,
    },
  },
  font = wezterm.font 'CaskaydiaCove Nerd Font',
  color_scheme = 'OneDark (base16)',
  default_cursor_style = 'SteadyBar',
  scrollback_lines = 90000,
  adjust_window_size_when_changing_font_size = false,
  initial_rows = 50,
  initial_cols = 200,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = 0.96,
}
