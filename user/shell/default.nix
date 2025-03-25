{ userSettings, ... }@arg:
{
  imports = [
    ./cli.nix
    ./dev-tools.nix
    ./git.nix
    ./${userSettings.shell + ".nix"}
    ./editor/${userSettings.editor = "./nix"}
  ];
}
