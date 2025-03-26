{ userSettings, ... }@args:
{
  imports = [
    ./cli.nix
    ./dev-tools.nix
    ./git.nix
    ./${userSettings.shell}/${userSettings.shell + ".nix"}
    ./editor/${userSettings.editor}/${userSettings.editor + ".nix"}
    ./rice.nix
    ./yazi
  ];
}
