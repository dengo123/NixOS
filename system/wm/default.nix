{ userSettings, ... }@args:

{
  imports = [
    ./${userSettings.wm + ".nix"}
    ./pipewire.nix
    ./xdg-portal.nix
    ./stylix.nix
  ];
}

