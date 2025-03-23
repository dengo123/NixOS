{ pkgs, userSettings }:

[
  # Terminal & Browser
  "SUPER, RETURN, exec, ${userSettings.term}"
  "SUPER, B, exec, ${pkgs.firefox}/bin/firefox"

  # App Launcher (optional: wofi)
  "SUPER, D, exec, ${pkgs.wofi}/bin/wofi --show drun"

  # Fenster-Navigation
  "SUPER, H, movefocus, l"
  "SUPER, L, movefocus, r"
  "SUPER, K, movefocus, u"
  "SUPER, J, movefocus, d"

  # Floating Toggle
  "SUPER, SPACE, togglefloating"

  # Fenster schließen
  "SUPER, Q, killactive"

  # Lock
  "SUPER, L, exec, ${pkgs.swaylock-effects}/bin/swaylock"

  # Screenshot
  "SUPER, S, exec, grim -g \"$(slurp)\" ~/Pictures/screenshot.png"

  # Workspace-Switching (1–10)
  "SUPER, 1, workspace, 1"
  "SUPER, 2, workspace, 2"
  "SUPER, 3, workspace, 3"
  "SUPER, 4, workspace, 4"
  "SUPER, 5, workspace, 5"
  "SUPER, 6, workspace, 6"
  "SUPER, 7, workspace, 7"
  "SUPER, 8, workspace, 8"
  "SUPER, 9, workspace, 9"
  "SUPER, 0, workspace, 10"

  # Move window to workspace
  "SUPER SHIFT, 1, movetoworkspace, 1"
  "SUPER SHIFT, 2, movetoworkspace, 2"
  "SUPER SHIFT, 3, movetoworkspace, 3"
  "SUPER SHIFT, 4, movetoworkspace, 4"
  "SUPER SHIFT, 5, movetoworkspace, 5"
  "SUPER SHIFT, 6, movetoworkspace, 6"
  "SUPER SHIFT, 7, movetoworkspace, 7"
  "SUPER SHIFT, 8, movetoworkspace, 8"
  "SUPER SHIFT, 9, movetoworkspace, 9"
  "SUPER SHIFT, 0, movetoworkspace, 10"
]

