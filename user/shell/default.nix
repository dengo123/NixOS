{ userSettings, ... }@args:
{
  imports = [
    ./cli.nix
    ./dev-tools.nix
    ./git.nix
    ./${userSettings.shell + ".nix"}
    ./editor/${userSettings.editor}/${userSettings.editor + ".nix"}
  ];
}
