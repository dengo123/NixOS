{ config, lib, pkgs, ... }:

{
  home.file.".config/nvim".source = ./nvim;

  programs.neovim = {
    enable = true;
  };
}
