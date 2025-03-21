{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #Fancies
    fastfetch
    pipes
    cava
    peaclock
    cbonsai
    asciiquarium-transparent
    nyancat
    cmatrix
    cowsay
    fortune
    sl
  ];
}

