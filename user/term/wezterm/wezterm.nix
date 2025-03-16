{ config, pkgs, lib, ... }:
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require("wezterm")
      local config = wezterm.config_builder()

      -- Nutzt die zentral definierten Font-Einstellungen
      config.font = wezterm.font("JetBrains Mono")
      config.font_size = 15

      -- Fenster- und Hintergrund-Einstellungen
      config.window_background_opacity = 0.7
      config.macos_window_background_blur = 7
      config.window_decorations = "RESIZE"
      config.window_padding = { left = 8, right = 8, top = 8, bottom = 8 }

      -- Tab-Bar-Einstellungen
      config.enable_tab_bar = true
      config.use_fancy_tab_bar = true
      config.tab_and_split_indices_are_zero_based = true
      config.tab_bar_at_bottom = true
      config.hide_tab_bar_if_only_one_tab = true

      return config
    '';
  };
}

