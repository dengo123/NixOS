{ config, pkgs, userSettings, ... }:

{
  imports = let
    wmModule = if userSettings.wm == "cosmic"
      then []
    else [ ../../../user/wm/${userSettings.wm}/${userSettings.wm}.nix ];
     in wmModule ++ 
    [ 
      ../../user/shell/${userSettings.shell}.nix 
      ../../user/term/${userSettings.term}/${userSettings.term}.nix
  #    ../../user/style/stylix.nix
      ../../user/editor/neovim/nixvim.nix
    ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  programs.git = {
    enable = true;
    userName = "dengo123";
    userEmail = "deniz060198@hotmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/dengo123/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "neovim";
  };

   # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
