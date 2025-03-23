{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wineWowPackages.full
    bottles
    steam
    protonup-qt # GUI-Tool für Proton-Versionen
    lutris
  ];

  home.shellAliases = {
    winecfg = "winecfg";
    winetricks = "winetricks";
  };

  fonts.fontconfig.enable = true;

  # Optional: Steam autostart mit Proton-Support vorbereiten
  xdg.configFile."proton.env".text = ''
    STEAM_FORCE_PROTON=1
    PROTON_USE_WINED3D=1
  '';
}

