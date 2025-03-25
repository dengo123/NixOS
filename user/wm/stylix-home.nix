{ config, lib, ... }:

let
  rawColors = lib.importTOML "/etc/stylix/colors.toml";

  renderTemplate = text:
    builtins.replaceStrings
      (map (x: "{{${x}}}") (builtins.attrNames rawColors))
      (builtins.attrValues rawColors)
      text;

  ompTemplate = builtins.readFile ../../user/shell/zsh/omp/template.toml;

  colorsLua = ''
    return {
      base00 = "${rawColors.base00}",
      base01 = "${rawColors.base01}",
      base02 = "${rawColors.base02}",
      base03 = "${rawColors.base03}",
      base04 = "${rawColors.base04}",
      base05 = "${rawColors.base05}",
      base06 = "${rawColors.base06}",
      base07 = "${rawColors.base07}",
      base08 = "${rawColors.base08}",
      base09 = "${rawColors.base09}",
      base0A = "${rawColors.base0A}",
      base0B = "${rawColors.base0B}",
      base0C = "${rawColors.base0C}",
      base0D = "${rawColors.base0D}",
      base0E = "${rawColors.base0E}",
      base0F = "${rawColors.base0F}",
    }
  '';
in {
  home.file = {
    "${config.xdg.configHome}/nvim/lua/colors.lua".text = colorsLua;
    "${config.xdg.configHome}/oh-my-posh/themes/generated.omp.toml".text = renderTemplate ompTemplate;
  };
}

