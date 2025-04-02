{ config, pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      background = [
        {
          monitor = "";
          path = "${../../themes/${config.userSettings.theme}/background.png}";
          blur = true;
        }
      ];

      label = [
        {
          monitor = "";
          text = "Welcome back, ${config.userSettings.username}!";
          color = "rgba(ffffffcc)";
          font_size = 24;
          position = "0, -150";
          valign = "center";
          halign = "center";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 50";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.2;
          inner_color = "rgba(000000aa)";
          font_color = "rgb(ffffff)";
          outline_color = "rgb(888888)";
          position = "0, 50";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}

