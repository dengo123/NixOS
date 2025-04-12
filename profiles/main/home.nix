{ userSettings, ... }:

{
  imports = [ ../../user ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  home.activation.backupFileExtension = "";

  home.stateVersion = "24.11"; # Please read the comment before changing.

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
    EDITOR = userSettings.editor;
  };

   # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
