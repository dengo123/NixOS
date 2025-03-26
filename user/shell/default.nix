{ userSettings, ... }@args:
{
  imports = [
    ./cli.nix
    ./dev-tools.nix
    ./git.nix
    ./${userSettings.shell}/${userSettings.shell + ".nix"}
    ./editor/${userSettings.editor}
    ./rice.nix
    ./yazi
  ];
}
