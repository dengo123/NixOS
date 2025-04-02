{ config, pkgs, lib, userSettings, ... }:

let
  themeDir = ../../themes/${userSettings.theme};
  colors = lib.importTOML "${themeDir}/colors.toml";
in
{
  home.packages = with pkgs; [ dunst libnotify ];

  services.dunst = {
    enable = true;

    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        geometry = "300x5-10+30";
        offset = "10x10";
        shrink = "yes";
        transparency = 10;
        padding = 10;
        horizontal_padding = 10;
        frame_width = 2;
        frame_color = colors.base0D;
        separator_color = "frame";
        sort = "yes";
        idle_threshold = 120;
        font = "${userSettings.font} 10";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\\n%b";
        alignment = "left";
        show_age_threshold = 60;
        word_wrap = "yes";
        ellipsize = "end";
        ignore_newline = "no";
        icon_position = "left";
        max_icon_size = 48;
        sticky_history = "yes";
        history_length = 20;
        dmenu = "rofi -dmenu -p dunst:";
        browser = "xdg-open";
      };

      urgency_low = {
        background = colors.base00;
        foreground = colors.base05;
        timeout = 5;
      };

      urgency_normal = {
        background = colors.base00;
        foreground = colors.base05;
        timeout = 10;
      };

      urgency_critical = {
        background = colors.base00;
        foreground = colors.base08;
        frame_color = colors.base08;
        timeout = 0;
      };
    };
  };
}

