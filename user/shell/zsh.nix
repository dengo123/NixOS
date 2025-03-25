{ config, pkgs, ... }:
let
  # Choose keymap "emacs", "vicmd", "viins"
  keymap = "emacs";

  # My aliases
  myAliases = {
    ll = "ls -lah";
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    grep = "grep --color=auto";
    upgrade = "sudo nix flake update --flake ~/.dotfiles/NixOS && sudo nixos-rebuild switch --flake ~/.dotfiles/NixOS#system";
    update = "sudo nixos-rebuild switch --flake ~/.dotfiles/NixOS#system";
    switch = " home-manager switch --flake ~/.dotfiles/NixOS#user";

    v = "nvim";
    n = "nano";
    e = "emacs";

    cl = "clear";
    r = "reboot";
    pw = "poweroff";

    g = "git";
    ga = "git add";
    gaa = "git add --all";
    gp = "git push";
    gl = "git pull";
    gc = "git commit";
    gcam = "git commit -a -m";
  };
  
  # Highlighter styles
  myStyles = {
    comment = "fg=grey";
    command = "fg=green";
    unknown-command = "fg=red";
    option = "fg=cyan";
    argument = "fg=yellow";
    path = "fg=blue";           
    alias = "fg=magenta";
    single-quoted-argument ="fg=orange";
    double-quoted-argument ="fg=orange";
    backticks = "fg=cyan";
    globbing = "fg=yellow";
    history-expansion = "fg=red";
    reserved-word = "fg=white"; 
    function = "fg=blue";
  };

in  
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
      styles = myStyles;
    };
    history = {
      size = 10000;
      path = "${config.home.homeDirectory}/zsh_history";
      share = true;
      append = true;
      extended = true;
      ignoreDups = true;
      ignoreSpace = true;
      ignoreAllDups = true;
    };
    initExtra = ''
      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	      yazi "$@" --cwd-file="$tmp"
	      if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		      builtin cd -- "$cwd"
	    fi
	    rm -f -- "$tmp"
    }
      eval "$(oh-my-posh init zsh --config ${config.xdg.configHome}/oh-my-posh/themes/generated.omp.toml)"
    '';
    defaultKeymap = keymap;
    shellAliases = myAliases;
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file."${config.xdg.configHome}/oh-my-posh/themes/generated.omp.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink ../../user/style/oh-my-posh/generated.omp.toml; };
} 
