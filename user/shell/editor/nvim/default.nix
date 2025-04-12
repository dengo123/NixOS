{ inputs, ... }:

{
  programs.nixvim = { 
    enable = true;
  };

  imports = [ 
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
  ];

  home.file.".config/nvim/doc/nixvim.txt".source =
    ./nixvim.txt;
}

