{ config, pkgs, userSettings, ... }:

let
  keybindings = import ./keybindings.nix { inherit pkgs userSettings; };
  settings = import ./settings.nix { inherit config pkgs userSettings; };
in {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = settings // {
      bind = keybindings;
    };
  };

  home.packages = with pkgs; [ kitty ];

  programs.bash.profileExtra = ''
    if [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Hyprland >/dev/null; then
      exec Hyprland
    fi
  '';
} 

