{ config, lib, pkgs, userSettings, ... }:

{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # ── Programme ─────────────────────────────────────
      "SUPER, RETURN, exec, ${userSettings.term}"
      "SUPER, Q, killactive"
      "SUPER, SHIFT+Q, exit"
      "SUPER, E, exec, dolphin"
      "SUPER, B, exec, firefox"
      "SUPER, V, togglefloating"

      # ── Fenster / Navigation ───────────────────────────────
      "SUPER, LEFT, movefocus, l"
      "SUPER, RIGHT, movefocus, r"
      "SUPER, UP, movefocus, u"
      "SUPER, DOWN, movefocus, d"

      # ── Fenster verschieben ────────────────────────────────
      "SUPER_SHIFT, LEFT, movewindow, l"
      "SUPER_SHIFT, RIGHT, movewindow, r"
      "SUPER_SHIFT, UP, movewindow, u"
      "SUPER_SHIFT, DOWN, movewindow, d"

      # ── Fenster rotieren ───────────────────────────────────
      "SUPER, R, layoutmsg, cyclenext"

      # ── Layout wechseln ────────────────────────────────────
      "SUPER, M, togglesplit"  # togglesplit funktioniert gut mit dwindle/master

      # ── Workspaces ─────────────────────────────────────────
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

      # ── Fenster in Workspace verschieben ───────────────────
      "SUPER_SHIFT, 1, movetoworkspace, 1"
      "SUPER_SHIFT, 2, movetoworkspace, 2"
      "SUPER_SHIFT, 3, movetoworkspace, 3"
      "SUPER_SHIFT, 4, movetoworkspace, 4"
      "SUPER_SHIFT, 5, movetoworkspace, 5"
      "SUPER_SHIFT, 6, movetoworkspace, 6"
      "SUPER_SHIFT, 7, movetoworkspace, 7"
      "SUPER_SHIFT, 8, movetoworkspace, 8"
      "SUPER_SHIFT, 9, movetoworkspace, 9"
      "SUPER_SHIFT, 0, movetoworkspace, 10"

      # ── App Launcher ───────────────────────────────────────
      "SUPER, SPACE, exec, rofi -show drun"

      # ── Sperren ────────────────────────────────────────────
      "SUPER, L, exec, hyprlock"
    ];
  };
}

