{ ... }:

{
  imports = [
    ./user.nix
    ./automount.nix
    ./pipewire.nix
    ./virt-system.nix
    ./gc.nix
    ./locales.nix
    ./networking.nix
  ];
}
