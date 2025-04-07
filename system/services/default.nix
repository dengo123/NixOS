{ ... }:
{
  imports = [
    ./user.nix
    ./pipewire.nix
    ./virt-system.nix
    ./gc.nix
    ./locales.nix
    ./networking.nix
  ];
}
