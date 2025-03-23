{ config, lib, pkgs, ... }:

{
  swapDevices = [
    {
      device = "/dev/disk/by-uuid/1732a389-92ec-42e7-af83-21d9fd326d5c";
      priority = 1;
    }
  ];

  boot.kernel.sysctl."vm.swappiness" = 10;
}

