{ pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.hyprland.override {
      plugins = with pkgs.hyprlandPlugins; [
        hyprfocus
        hyprexpo
        hyprtrails
      ];
    })
  ];
}

