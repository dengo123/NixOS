{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty; # Stellt sicher, dass das Ghostty-Paket verwendet wird
    settings = {
      font-size = 12;
      font-family = "JetBrainsMono Nerd Font";
    };
    enableZshIntegration = true;
  };
}

