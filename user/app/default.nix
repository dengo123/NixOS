{ userSettings }@args:
{
  imports = [
    ./libreoffice.nix
    ./virt-home.nix
    ./term/${userSettings.term + ".nix"}
  ];
}
