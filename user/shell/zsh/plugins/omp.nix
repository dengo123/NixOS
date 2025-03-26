{ config, pkgs, lib, userSettings, ... }:

let
  themeDir = ../../../../themes/${userSettings.theme};
  stylixColors = lib.importTOML "${themeDir}/colors.toml";
  template = builtins.readFile ../omp/template-base16.toml;

  rendered = lib.replaceStrings
    [
      "p:base00" "p:base01" "p:base02" "p:base03"
      "p:base04" "p:base05" "p:base06" "p:base07"
      "p:base08" "p:base09" "p:base0A" "p:base0B"
      "p:base0C" "p:base0D" "p:base0E" "p:base0F"
    ] [
      stylixColors.base00 stylixColors.base01 stylixColors.base02 stylixColors.base03
      stylixColors.base04 stylixColors.base05 stylixColors.base06 stylixColors.base07
      stylixColors.base08 stylixColors.base09 stylixColors.base0A stylixColors.base0B
      stylixColors.base0C stylixColors.base0D stylixColors.base0E stylixColors.base0F
    ] template;

in {
  programs.oh-my-posh.enable = true;

  home.file.".config/oh-my-posh/stylix.toml".text = rendered;

  programs.zsh.initExtra = ''
    eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/stylix.toml)"

    ## yazi-Funktion für automatische Ordnernavigation
    function y() {
      local tmp="$(mktemp -t \"yazi-cwd.XXXXXX\")" cwd
      yazi "$@" --cwd-file="$tmp"
      if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
      fi
      rm -f -- "$tmp"
    }

    ## fzf keybindings + completion
    [ -f "${pkgs.fzf}/share/fzf/key-bindings.zsh" ] && source "${pkgs.fzf}/share/fzf/key-bindings.zsh"
    [ -f "${pkgs.fzf}/share/fzf/completion.zsh" ] && source "${pkgs.fzf}/share/fzf/completion.zsh"
  '';
}
