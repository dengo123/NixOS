{ config, pkgs, lib, userSettings, ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      input-fields = [
        {
          monitor = "";
          size = {
            width = 250;
            height = 60;
          };
          outline_thickness = 3;
          dots_size = 0.33;
          dots_spacing = 0.15;
          dots_center = true;
          outer_color = "rgba(0, 0, 0, 0.5)";
          inner_color = "rgba(255, 255, 255, 0.2)";
          font_color = "rgba(255, 255, 255, 1.0)";
        }
      ];

      labels = [
        {
          monitor = "";
          text = "Welcome, ${userSettings.name}";
          position = {
            x = 0.5;
            y = 0.35;
          };
          font_size = 26;
          valign = "center";
          halign = "center";
        }

        {
          monitor = "";
          text = "$TIME";
          position = {
            x = 0.5;
            y = 0.45;
          };
          font_size = 32;
          valign = "center";
          halign = "center";
        }
      ];

      general = {
        hide_cursor = true;
        grace = 5;
        no_fade_in = false;
      };
    };
  };
}

