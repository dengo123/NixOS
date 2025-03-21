{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    # Hier kannst du yazi-spezifische Einstellungen setzen:
    settings = {
      editor = "nvim";  # Legt den Editor fest, der beim Öffnen von Dateien genutzt wird
      # Weitere yazi-Einstellungen können hier ergänzt werden
    };
    # Beispiel für Theme-Einstellungen:
    theme = "dracula";  # oder ein anderes verfügbares Theme
    # Optionale zsh-Integration aktivieren:
    zshIntegration = true;
  };
}

