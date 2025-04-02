{ config, pkgs, lib, userSettings, ... }:

let
  themeDir = ../../themes/${userSettings.theme};
  colors = lib.importTOML "${themeDir}/colors.toml";

  fastfetchConfig = pkgs.writeText "config.jsonc" (builtins.toJSON {
    display = {
      separator = " ";
      color = colors.base0D;
    };

    modules = [
      { type = "title"; color = colors.base08; }
      { type = "os"; color = colors.base05; }
      { type = "host"; color = colors.base05; }
      { type = "kernel"; color = colors.base05; }
      { type = "wm"; color = colors.base0C; }
      { type = "terminal"; color = colors.base0A; }
      { type = "shell"; color = colors.base0E; }
      { type = "memory"; color = colors.base09; }
      { type = "packages"; color = colors.base0B; }
      { type = "uptime"; color = colors.base07; }
    ];

    logo = {
      type = "nixos";
      color = colors.base0D;
    };

    font = {
      name = userSettings.font;
      size = 11;
    };
  });
in
{
  home.packages = with pkgs; [ fastfetch ];

  xdg.configFile."fastfetch/config.jsonc".source = fastfetchConfig;
}

