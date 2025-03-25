{ config, lib, pkgs, ... }:

{
  programs = {
    zsh.enable = true;
    oh-my-posh.enable = true;
  };

  imports = import ./plugins
}
