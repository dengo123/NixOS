-- Laden der WezTerm-API und Module
local wezterm = require("wezterm")
local colors = require("colors")

-- Erstellung der Konfigurationstabelle
local config = wezterm.config_builder()

-- 1. Schriftart und Schriftgröße
config.font = wezterm.font("JetBrains Mono")
config.font_size = 15

-- 2. Fenster- und Hintergrund-Einstellungen
config.window_background_opacity = 0.7
config.macos_window_background_blur = 7
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}

-- 3. Tab-Bar-Einstellungen
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

config.colors = colors -- Globale Farben laden
config.colors.tab_bar = colors.tab_bar

-- 4. Tmux-ähnliche Keybindings und Leader-Key
config.leader = { key = "q", mods = "ALT", timeout_milliseconds = 2000 }

config.keys = {
  -- Tabs erstellen und navigieren
  { key = "t", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
  { key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
  { key = "b", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },

  -- Panes erstellen und schließen
  { key = "v", mods = "LEADER", action = wezterm.action.SplitPane({ direction = "Right", size = { Percent = 50 } }) },
  { key = "s", mods = "LEADER", action = wezterm.action.SplitPane({ direction = "Down", size = { Percent = 50 } }) },
  { key = "w", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },

  -- Zwischen Panes navigieren
  { key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },

  -- Pane-Größen anpassen
  { key = "LeftArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
  { key = "RightArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
  { key = "DownArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
  { key = "UpArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
}

for i = 0, 9 do
  -- leader + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = wezterm.action.ActivateTab(i),
  })
end

-- 5. Statusleiste
wezterm.on("update-right-status", function(window, _)
  local SOLID_LEFT_ARROW = ""
  local ARROW_FOREGROUND = { Foreground = { Color = colors.tab_bar.active_tab.bg_color } } -- Active tab color
  local prefix = ""

  if window:leader_is_active() then
    prefix = "  " .. utf8.char(0x1f30a) -- ocean wave
    SOLID_LEFT_ARROW = utf8.char(0xe0b2)
  end

  if window:active_tab():tab_id() == 0 then
    ARROW_FOREGROUND = { Foreground = { Color = colors.tab_bar.inactive_tab.bg_color } } -- Inactive tab color
  end -- Arrow color based on whether the tab is active or not

  window:set_left_status(wezterm.format {
    { Background = { Color = colors.tab_bar.inactive_tab_hover.bg_color } }, -- Inactive tab hover color
    { Text = prefix },
    ARROW_FOREGROUND,
    { Text = SOLID_LEFT_ARROW },
  })
end)

-- Rückgabe der Konfiguration
return config

