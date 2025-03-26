{ config, pkgs, ... }:

let
  deleteOlderThan = "14d";
in {
  systemd.user.timers."home-manager-gc" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true;
    };
  };

  systemd.user.services."home-manager-gc" = {
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.nix}/bin/nix-collect-garbage --delete-older-than ${deleteOlderThan}";
    };
  };
}

