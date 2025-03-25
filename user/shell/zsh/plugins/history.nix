{ config, ... }: {
  programs.zsh.history = {
    size = 10000;
    path = "${config.home.homeDirectory}/zsh_history";
    share = true;
    append = true;
    extended = true;
    ignoreDups = true;
    ignoreSpace = true;
    ignoreAllDups = true;
  };
}

