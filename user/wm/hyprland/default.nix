{ config, lib, pkgs, userSettings, ... }:

let
  autostart = import ./autostart.nix { inherit pkgs; };
  keybindings = import ./keybindings.nix { inherit pkgs userSettings; };
  settings = import ./settings.nix { inherit config pkgs userSettings; };
in {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = settings // {
      bind = keybindings;
      exec-once = autostart.exec-once;
    };
  };

  programs.bash.profileExtra = ''
    if [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Hyprland >/dev/null; then
      exec Hyprland
    fi
  '';

  home.packages = with pkgs; [ kitty ] ++ autostart.home.packages;
}

