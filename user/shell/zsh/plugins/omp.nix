{ config, lib, pkgs, stylix, ... }:

let
  inherit (stylix.colors)
    base00 base01 base02 base03 base04 base05 base06 base07
    base08 base09 base0A base0B base0C base0D base0E base0F accent;

  template = builtins.readFile ../omp/template-base16.toml;

  replacements = {
    "p:base00" = base00;
    "p:base01" = base01;
    "p:base02" = base02;
    "p:base03" = base03;
    "p:base04" = base04;
    "p:base05" = base05;
    "p:base06" = base06;
    "p:base07" = base07;
    "p:base08" = base08;
    "p:base09" = base09;
    "p:base0A" = base0A;
    "p:base0B" = base0B;
    "p:base0C" = base0C;
    "p:base0D" = base0D;
    "p:base0E" = base0E;
    "p:base0F" = base0F;
    "p:accent" = accent;
  };

  rendered = lib.foldlAttrs
    (acc: key: value: builtins.replaceStrings [ key ] [ value ] acc)
    template
    replacements;

in {
  home.packages = [ pkgs.oh-my-posh ];

  xdg.configFile."oh-my-posh/themes/stylix.omp.toml".text = rendered;

  programs.zsh.initExtra = ''
    eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/stylix.omp.toml)"
  '';
}

