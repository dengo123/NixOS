{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
  };
  home.file.".config/yazi" = {
    source = ./yazi;
  };
}

