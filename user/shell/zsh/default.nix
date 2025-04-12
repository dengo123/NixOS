{...}: {
  programs.zsh.enable = true;

  imports = import ./plugins;
}
