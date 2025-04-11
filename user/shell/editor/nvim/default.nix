{ ... }:

{
  programs.nixvim = { 
    enable = true;
    colorschemes.base16.enable = true;
    
  };
  imports = import ./plugins;

  home.file.".config/nvim/doc/nixvim.txt".source =
    ./nixvim.txt;
}

