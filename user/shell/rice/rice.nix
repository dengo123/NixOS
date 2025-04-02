{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #Fancies
    btop
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

