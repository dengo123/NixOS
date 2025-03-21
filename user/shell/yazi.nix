{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    settings = {
      editor = { command = "nvim"; }; 
    };
    enableZshIntegration = true;
  };
}

