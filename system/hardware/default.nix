{ systemSettings, ... }@args:
{
  imports = [
    ./${systemSettings.gpuType + ".nix"}
    ./bluetooth.nix
    ./swap.nix
  ];
}
