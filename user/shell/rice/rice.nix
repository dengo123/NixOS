{pkgs, ...}: {
  home.packages = with pkgs; [
    #Fancies
    fastfetch
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
