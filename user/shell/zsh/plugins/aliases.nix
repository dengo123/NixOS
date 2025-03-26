{ ... }: {
  programs.zsh.shellAliases = {
    ll = "ls -lah";
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    grep = "grep --color=auto";
    upgrade = "sudo nix flake update --flake ~/.dotfiles/NixOS && sudo nixos-rebuild switch --flake ~/.dotfiles/NixOS#system";
    update = "sudo nixos-rebuild switch --flake ~/.dotfiles/NixOS#system";
    switch = "home-manager switch --flake ~/.dotfiles/NixOS#user";
    v = "nvim";
    n = "nano";
    e = "emacs";
    cl = "clear";
    r = "reboot";
    po = "poweroff";
    g = "git";
    ga = "git add";
    gaa = "git add --all";
    gp = "git push";
    gl = "git pull";
    gc = "git commit";
    gcam = "git commit -a -m";
  };
}

