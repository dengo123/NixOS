{ config, lib, pkgs, userSettings, ... }:

let
  themeDir = ../../../../themes/${userSettings.theme};
  rgbaLib = import ../../../../lib/colors-rgba.nix { inherit lib themeDir; };
  rgba = rgbaLib.rgba 1.0;
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
          color = "${rgba.base00}";
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
          outer_color = "${rgba.base0D}";
          inner_color = "${rgba.base00}";
          font_color = "${rgba.base05}";
          fail_color = "${rgba.base08}";
          capslock_color = "${rgba.base09}";
          check_color = "${rgba.base0B}";
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
          color = "${rgba.base05}";
          position = "0, 16";
          valign = "center";
          halign = "center";
        }
        {
          monitor = "";
          text = "Welcome, ${userSettings.name}";
          color = "${rgba.base05}";
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

