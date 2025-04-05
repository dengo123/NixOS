{ config, lib, pkgs, userSettings, ... }:

let
  themeDir = ../../../../themes/${userSettings.theme};
  colors = lib.importTOML "${themeDir}/colors.toml";
in {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        grace = 5;
        hide_cursor = true;
      };

      background = [
        {
          monitor = "";
          path = "${themeDir}/background.png";
          color = "${colors.base00}";
          blur_size = 3;
          blur_passes = 2;
          noise = 0.0117;
          contrast = 1.0;
          brightness = 1.0;
          vibrancy = 0.21;
          vibrancy_darkness = 0.0;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "250, 50";
          outline_thickness = 3;
          outer_color = colors.base0D;
          inner_color = colors.base00;
          font_color = colors.base05;

          # neue Zustände
          fail_color = colors.base08;
          capslock_color = colors.base09;
          check_color = colors.base0B;

          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          fade_on_empty = false;
          placeholder_text = "Password...";
          dots_size = 0.2;
          dots_spacing = 0.64;
          dots_center = true;
          position = "0, 140";
          halign = "center";
          valign = "bottom";
        }
      ];

      label = [
        {
          monitor = "";
          text = "cmd[update:1000] date +\"%H:%M:%S\"";
          font_size = 64;
          font_family = userSettings.font;
          color = colors.base0D;
          position = "0, 16";
          valign = "center";
          halign = "center";
        }
        {
          monitor = "";
          text = "Welcome, ${userSettings.name}";
          color = colors.base0D;
          font_size = 20;
          font_family = userSettings.font;
          position = "0, 100";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}

