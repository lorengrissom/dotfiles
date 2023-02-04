local wezterm = require 'wezterm'
local act = wezterm.action

return {
  default_prog = { '/usr/bin/zsh' },
  font = wezterm.font 'CaskaydiaCove Nerd Font',
  leader = { key = 'Space', mods = 'CTRL|SHIFT' },

  keys = {
    { key = 'a', mods = 'CTRL', action = wezterm.action.ShowTabNavigator },
    {
      key = 'r',
      mods = 'LEADER',
      action = act.ActivateKeyTable {
        name = 'resize_pane',
        one_shot = false,
      },
    },
    {
      key = 'a',
      mods = 'LEADER',
      action = act.ActivateKeyTable {
        name = 'activate_pane',
        timeout_milliseconds = 1000,
      },
    },
    {
      key = 'n',
      mods = 'ALT',
      action = act.SpawnTab 'CurrentPaneDomain',
    },
    {
      key = 's',
      mods = 'ALT',
      action = act.SplitPane {
        direction = 'Right',
        size = { Percent = 50 }
      }
    },
    {
      key = 'd',
      mods = 'ALT',
      action = act.SplitPane {
        direction = 'Down',
        size = { Percent = 50 }
      }
    },
    {
      key = 'x',
      mods = 'ALT',
      action = act.CloseCurrentPane {
        confirm = false
      }
    },
    {
      key = 'l',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Next',
    },
    {
      key = 'h',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Prev',
    },
  },

  key_tables = {
    -- Defines the keys that are active in our resize-pane mode.
    -- Since we're likely to want to make multiple adjustments,
    -- we made the activation one_shot=false. We therefore need
    -- to define a key assignment for getting out of this mode.
    -- 'resize_pane' here corresponds to the name="resize_pane" in
    -- the key assignments above.
    resize_pane = {
      { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 1 } },
      { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },

      { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
      { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },

      { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 1 } },
      { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },

      { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 1 } },
      { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },

      -- Cancel the mode by pressing escape
      { key = 'Escape', action = 'PopKeyTable' },
    },

    -- Defines the keys that are active in our activate-pane mode.
    -- 'activate_pane' here corresponds to the name="activate_pane" in
    -- the key assignments above.
    activate_pane = {
      { key = 'LeftArrow', action = act.ActivatePaneDirection 'Left' },
      { key = 'h', action = act.ActivatePaneDirection 'Left' },

      { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
      { key = 'l', action = act.ActivatePaneDirection 'Right' },

      { key = 'UpArrow', action = act.ActivatePaneDirection 'Up' },
      { key = 'k', action = act.ActivatePaneDirection 'Up' },

      { key = 'DownArrow', action = act.ActivatePaneDirection 'Down' },
      { key = 'j', action = act.ActivatePaneDirection 'Down' },
    },
  },

  hyperlink_rules = {
    -- Linkify things that look like URLs and the host has a TLD name.
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
      regex = '\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b',
      format = '$0',
    },

    -- linkify email addresses
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
      regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
      format = 'mailto:$0',
    },

    -- file:// URI
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
      regex = [[\bfile://\S*\b]],
      format = '$0',
    },

    -- Linkify things that look like URLs with numeric addresses as hosts.
    -- E.g. http://127.0.0.1:8000 for a local development server,
    -- or http://192.168.1.1 for the web interface of many routers.
    {
      regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
      format = '$0',
    },

    -- Make task numbers clickable
    -- The first matched regex group is captured in $1.
    {
      regex = [[\b[tT](\d+)\b]],
      format = 'https://example.com/tasks/?t=$1',
    },

    -- Make username/project paths clickable. This implies paths like the following are for GitHub.
    -- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
    -- As long as a full URL hyperlink regex exists above this it should not match a full URL to
    -- GitHub or GitLab / BitBucket (i.e. https://gitlab.com/user/project.git is still a whole clickable URL)
    {
      regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
      format = 'https://www.github.com/$1/$3',
    },
  },

  color_scheme = "OneDark (base16)",
  window_background_opacity = 0.96,
  scrollback_lines = 90000,
  initial_cols = 180,
  initial_rows = 45,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  tab_max_width = 20,
}
