{ pkgs, stylix, ... }:

{
  config = {
    stylix.enable = true;

    # Kein GTK, kein Cursor, kein Wallpaper im User-Modul
    stylix.targets = {
      gtk.enable = false;
      cursor.enable = false;
      wallpaper.enable = false;
      vscode.enable = false;
      zellij.enable = false;
    };

    stylix.base16Scheme = stylix.colors;

    stylix.fonts = {
      monospace = stylix.fonts.monospace;
      sansSerif = stylix.fonts.sansSerif;
      serif     = stylix.fonts.serif;
      emoji     = stylix.fonts.emoji;
    };
  };
}

