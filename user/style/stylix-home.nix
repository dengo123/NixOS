{ config, lib, ... }:

let
  colors = config.stylix.colors;

  renderTemplate = text:
    builtins.replaceStrings
      (map (x: "{{${x}}}") (builtins.attrNames colors))
      (builtins.attrValues colors)
      text;

  ompTemplate = builtins.readFile ../../user/shell/zsh/omp/template.toml;

  colorsLua = ''
    return {
      base00 = "${colors.base00}",
      base01 = "${colors.base01}",
      base02 = "${colors.base02}",
      base03 = "${colors.base03}",
      base04 = "${colors.base04}",
      base05 = "${colors.base05}",
      base06 = "${colors.base06}",
      base07 = "${colors.base07}",
      base08 = "${colors.base08}",
      base09 = "${colors.base09}",
      base0A = "${colors.base0A}",
      base0B = "${colors.base0B}",
      base0C = "${colors.base0C}",
      base0D = "${colors.base0D}",
      base0E = "${colors.base0E}",
      base0F = "${colors.base0F}",
    }
  '';
in {
  home.file = {
    "${config.xdg.configHome}/nvim/lua/colors.lua".text = colorsLua;
    "${config.xdg.configHome}/oh-my-posh/themes/generated.omp.toml".text = renderTemplate ompTemplate;
  };
}

