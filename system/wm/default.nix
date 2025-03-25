{ userSettings, ... }@args:

{
  imports = [
    ./${userSettings.wm + ".nix"}
    ./xdg-portal.nix
    ./stylix.nix
  ];
}

