{
  pkgs,
  userSettings,
  theme,
  ...
}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;

    settings = {
      font-size = 12;
      font-family = userSettings.font;

      background-opacity = 0.8;
      background = theme.base01;

      foreground = theme.base05;
      cursor-color = theme.base05;
    };

    enableZshIntegration = true;
  };
}
