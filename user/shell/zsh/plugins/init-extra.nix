{ config, pkgs, ... }:

{
  programs.zsh.initExtra = ''
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

    # Fastfetch anzeigen beim Login
    if [ "$SHLVL" = 1 ] && [ -z "$TMUX" ]; then
      fastfetch
    fi
  '';
}

