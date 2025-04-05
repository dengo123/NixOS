#!/usr/bin/env bash

chosen=$(printf "%s\n" \
  " App Launcher" \
  " Clipboard" \
  " Calculator" \
  " Bookmarks" \
  " Lock" \
  " Suspend" \
  " Reboot" \
  " Shutdown" | fuzzel --dmenu -p "Launch:")

case "$chosen" in
  *"App Launcher"*)
    fuzzel --dmenu | xargs swaymsg exec
    ;;
  *"Clipboard"*)
    cliphist list | fuzzel --dmenu | cliphist decode | wl-copy
    ;;
  *"Calculator"*)
    calc=$(fuzzel --dmenu -p "Calc:")
    [ -n "$calc" ] && echo "$calc" | bc | wl-copy
    ;;
  *"Lock"*)
    hyprlock
    ;;
  *"Suspend"*)
    systemctl suspend
    ;;
  *"Reboot"*)
    systemctl reboot
    ;;
  *"Shutdown"*)
    systemctl poweroff
    ;;
esac

