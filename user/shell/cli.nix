{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep         # Schnelle Textsuche
    fd              # Einfacher, schneller Ersatz für 'find'
    bat             # Verbesserte 'cat'-Version mit Syntax-Highlighting
    tmux            # Terminal-Multiplexer
    htop            # Interaktiver Prozess-Manager
    tree            # Verzeichnisstruktur anzeigen
    wget            # Herunterladen von Dateien
    curl            # Datenübertragung
    jq              # JSON Preview
    ffmpeg          # Video Thumbnails für yazi
    zoxide          # Vergangene Pfad Navigierung
    xclip           # system clipboard support
    stow
  ];
}

