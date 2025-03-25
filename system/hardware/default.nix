{ userSettings ... }@args:
{
  import = [
    ./${userSettings.gpuType} + ".nix"
    ./bluetooth.nix
    ./swap.nix
  ];
}
