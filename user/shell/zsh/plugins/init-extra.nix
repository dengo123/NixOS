{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    oh-my-posh
    yazi
    fzf
  ];

  programs.zsh.initExtra = ''
    ## oh-my-posh
    eval "$(oh-my-posh init zsh --config ${config.home.homeDirectory}/.dotfiles/config/zsh/themes/omp/everforest.toml)"

    ## yazi-Funktion für automatische Ordnernavigation
    function y() {
      local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
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

