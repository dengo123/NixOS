{userSettings, ...}: {
  imports = [
    ./cli.nix
    ./dev-tools.nix
    ./git.nix
    ./${userSettings.shell}
    ./editor/${userSettings.editor}
    ./rice
    ./yazi
  ];
}
