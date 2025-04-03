{ config, pkgs, lib, ... }:

{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        width = 300;
        height = 100;
        offset = "20x40";
        origin = "top-right";
        transparency = 10;
        frame_width = 2;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        vertical_padding = 8;
        corner_radius = 10; 
        word_wrap = true;
        ignore_newline = false;
        show_age_threshold = 60;
        mouse_left_click = "do_action";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
      };

      urgency_low.timeout = 5;
      urgency_normal.timeout = 10;
      urgency_critical.timeout = 0;
    };
  };
}

