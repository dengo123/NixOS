{ config, pkgs, lib, ... }:

let
  deleteOlderThan = "7d";
in {
  systemd.user.services.home-manager-gc = {
    Unit = {
      Description = "Home Manager Garbage Collector";
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.nix}/bin/nix-collect-garbage --delete-older-than ${deleteOlderThan}";
    };
  };

  systemd.user.timers.home-manager-gc = {
    Unit = {
      Description = "Weekly Home Manager Garbage Collection";
    };
    Timer = {
      OnCalendar = "weekly";
      Persistent = true;
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}

