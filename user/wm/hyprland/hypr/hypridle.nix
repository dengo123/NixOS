{ config, pkgs, ... }:

{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        before_sleep_cmd = "hyprlock";
        after_sleep_cmd = "loginctl lock-session";
        ignore_dbus_inhibit = false;
      };

      listener = [
        # 5 Minuten → Bildschirm sperren
        {
          timeout = 300;
          on-timeout = "hyprlock";
        }

        # 15 Minuten → Bildschirm aus
        {
          timeout = 900;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }

        # 30 Minuten → Suspend
        {
          timeout = 1800;
          on-timeout = "systemctl suspend";
        }

        # 60 Minuten -> Hibernate
        {
          timeout = 3600;
          on-timeout = "systemctl hibernate";
        }
      ];
    };
  };
}

