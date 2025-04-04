{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.enable = true;

  imports = [
    ./conf/monitor.nix
    ./conf/environment.nix
    ./conf/keyboard.nix
    ./conf/autostart.nix
    ./conf/window.nix
    ./conf/decoration.nix
    ./conf/layout.nix
    #  ./conf/workspace.nix
    ./conf/misc.nix
    ./conf/keybindings.nix
    ./conf/windowrules.nix
    ./conf/animation.nix
  ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
  ];
}

