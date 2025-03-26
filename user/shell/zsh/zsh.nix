{ config, lib, pkgs, ... }:

let
  # Stylix-Farben importieren
  colors = import ../../../lib/colors.nix { inherit lib; };

  # OMP-Template laden
  ompTemplate = builtins.readFile ./omp/template.toml;

  # Template-Renderer
  renderTemplate = text:
    builtins.replaceStrings
      (map (x: "{{${x}}}") (builtins.attrNames colors))
      (builtins.attrValues colors)
      text;
in {
  programs.zsh.enable = true;
  programs.oh-my-posh.enable = true;

  imports = import ./plugins;

  home.file."${config.xdg.configHome}/oh-my-posh/themes/generated.omp.toml".text =
    renderTemplate ompTemplate;
}

