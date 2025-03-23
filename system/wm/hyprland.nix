{ config, pkgs, ... }:

{
  # Display Manager deaktivieren
  services.displayManager.enable = false;

  # Autologin über TTY1
  services.getty.autoLogin.enable = true;
  services.getty.autoLogin.user = userSettings.username;

  # Hyprland systemweit aktivieren
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    kitty                          # Fallback-Terminal (wird z. B. für Hyprland-Fehler benötigt)
    xwayland                       # für XWayland-Kompatibilität
    wl-clipboard                   # für Copy-Paste in Wayland
    grim slurp                     # für Screenshots
    xdg-desktop-portal-hyprland    # Portale für Flatpak etc.
  ];

}

