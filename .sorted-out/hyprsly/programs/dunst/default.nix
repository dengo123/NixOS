{ config, lib, pkgs, userSettings, ... }:

let
  themeDir = ../../../../../themes/${userSettings.theme};
  colors = lib.importTOML "${themeDir}/colors.toml";
in {
  programs.dunst = {
    enable = true;

    settings = {
      global = {
        font = "${userSettings.font} 10";
        allow_markup = true;
        format = "<b>%s</b>\\n%b";
        sort = true;
        alignment = "left";
        bounce_freq = 0;
        show_age_threshold = 60;
        word_wrap = true;
        ignore_newline = false;
        transparency = 10;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 10;
        frame_width = 2;
        frame_color = "${colors.base01}";
        separator_color = "auto";
        idle_threshold = 120;
        monitor = 0;
        follow = "mouse";
        sticky_history = true;
        history_length = 20;
        show_indicators = true;
        icon_position = "left";
        max_icon_size = 64;
        icon_path = "/usr/share/icons:/home/${userSettings.username}/.config/dunst/icons";
        corner_radius = 10;
        mouse_left_click = "do_action";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
        browser = userSettings.browser;
      };

      urgency_low = {
        background = "${colors.base00}";
        foreground = "${colors.base05}";
        frame_color = "${colors.base01}";
        timeout = 4;
      };

      urgency_normal = {
        background = "${colors.base00}";
        foreground = "${colors.base05}";
        frame_color = "${colors.base02}";
        timeout = 8;
      };

      urgency_critical = {
        background = "${colors.base08}";
        foreground = "${colors.base00}";
        frame_color = "${colors.base08}";
        timeout = 0;
      };
    };
  };
}

