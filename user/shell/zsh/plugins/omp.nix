{ config, pkgs, lib, stylix, ... }:

let
  template = builtins.readFile ../omp/template-base16.toml;
  rendered = lib.replaceStrings
    [
      "p:base00" "p:base01" "p:base02" "p:base03"
      "p:base04" "p:base05" "p:base06" "p:base07"
      "p:base08" "p:base09" "p:base0A" "p:base0B"
      "p:base0C" "p:base0D" "p:base0E" "p:base0F"
    ] [
      stylix.colors.base00 stylix.colors.base01 stylix.colors.base02 stylix.colors.base03
      stylix.colors.base04 stylix.colors.base05 stylix.colors.base06 stylix.colors.base07
      stylix.colors.base08 stylix.colors.base09 stylix.colors.base0A stylix.colors.base0B
      stylix.colors.base0C stylix.colors.base0D stylix.colors.base0E stylix.colors.base0F
    ] template;
in {
  programs.oh-my-posh.enable = true;

  home.file.".config/oh-my-posh/stylix.toml".text = rendered;

  programs.zsh.initExtra = ''
    eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/stylix.toml)"
  '';
}

