{ config, pkgs, userSettings }:

{
  monitor = [
    "DP-2, 1920x1080@60, 0x0, 1"
    "DP-3, 1920x1080@60, 1920x0, 1"
  ];

  input = {
    kb_layout = "us";
    kb_variant = "";
    kb_options = "compose:ralt";
    follow_mouse = 1;
  };

  general = {
    gaps_in = 5;
    gaps_out = 10;
    border_size = 2;
  };

  decoration = {
    rounding = 10;
  };

  animations = {
    enabled = true;
    bezier = "myBezier, 0.05, 0.9, 0.1, 1.0";
    animation = [
      "windows, 1, 7, myBezier"
      "border, 1, 10, default"
      "fade, 1, 7, default"
      "workspaces, 1, 6, default"
    ];
  };

  dwindle = {
    pseudotile = true;
    preserve_split = true;
  };

  gestures.workspace_swipe = true;

  misc = {
    disable_hyprland_logo = true;
    disable_splash_rendering = true;
  };
}

