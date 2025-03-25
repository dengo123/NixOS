{ config, ... }:

{
  programs.nixvim.plugins.alpha = {
    enable = true;
    layout = [
      {
        type = "padding";
        val = 2;
      }
      {
        type = "text";
        opts = {
          hl = "Type";
          position = "center";
        };
        val = [
        "                                                                       "
        "                                                                       "
        "                                                                       "
        "                                                                       "
        "                                                                     "
        "       ████ ██████           █████      ██                     "
        "      ███████████             █████                             "
        "      █████████ ███████████████████ ███   ███████████   "
        "     █████████  ███    █████████████ █████ ██████████████   "
        "    █████████ ██████████ █████████ █████ █████ ████ █████   "
        "  ███████████ ███    ███ █████████ █████ █████ ████ █████  "
        " ██████  █████████████████████ ████ █████ █████ ████ ██████ "
        "                                                                       "
        "                                                                       "
        "                                                                       "
	];
      }
      {
        type = "padding";
        val = 2;
      }
      {
        type = "group";
	opts.position = "center";
        val = [
          {
            type = "button";
            val = "  New file";
            opts.shortcut = "n";
            on_press.__raw = "function() vim.cmd[[ene]] end";
          }
          {
            type = "button";
            val = "󰮗  Find file";
            opts.shortcut = "f";
            on_press.__raw = "function() vim.cmd[[Telescope find_files]] end";
          }
          {
            type = "button";
            val = "󰄉  Recent";
            opts.shortcut = "r";
            on_press.__raw = "function() vim.cmd[[Telescope oldfiles]] end";
          }
          {
            type = "button";
            val = "󰿅 Quit Neovim";
            opts.shortcut = "q";
            on_press.__raw = "function() vim.cmd[[qa]] end";
          }
        ];
      }
      {
        type = "padding";
        val = 2;
      }
      {
        type = "text";
        opts = {
          hl = "Keyword";
          position = "center";
        };
        val = [
        "┳┓┓┏  ┏┳┓┓┏┏┓  ┓ ┏┏┓┓┏"
        "┣┫┗┫   ┃ ┣┫┣   ┃┃┃┣┫┗┫"
        "┻┛┗┛   ┻ ┛┗┗┛  ┗┻┛┛┗┗┛"	
	];
      }
    ];
  };
}

