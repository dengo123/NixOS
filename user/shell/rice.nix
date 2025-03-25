{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #Fancies
    fastfetch
    pipes
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

