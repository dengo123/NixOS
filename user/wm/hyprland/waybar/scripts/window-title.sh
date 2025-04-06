#!/usr/bin/env bash

window=$(hyprctl activewindow -j)
class=$(echo "$window" | jq -r .class)
title=$(echo "$window" | jq -r .title)
pid=$(echo "$window" | jq -r .pid)

get_all_descendants() {
  local parent=$1
  local children
  children=$(pgrep -P "$parent")

  for pid in $children; do
    echo "$pid"
    get_all_descendants "$pid"
  done
}
all_descendants=$(get_all_descendants "$pid")

get_icon_for_file() {
  local file="$1"
  case "$file" in
    *.nix) echo "󱄅" ;;
    *.py) echo "" ;;
    *.lua) echo "" ;;
    *.json) echo "" ;;
    *.toml) echo "" ;;
    *.md) echo "" ;;
    *.sh) echo "" ;;
    *.rs) echo "" ;;
    *.ts) echo "" ;;
    *.js) echo "" ;;
    *.html) echo "" ;;
    *.css) echo "" ;;
    *.c) echo "" ;;
    *.cpp) echo "" ;;
    *) echo "" ;;
  esac
}

# Standardwerte
icon=""
label="$title"

# Sonderfall: Ghostty + nvim
if [[ "$class" == "com.mitchellh.ghostty" ]]; then
  # Gibt es einen nvim-Prozess mit Datei?
  file=$(echo "$all_descendants" \
    | xargs ps -o cmd= \
    | grep nvim \
    | grep -oE '(/[^ ]+\.(nix|py|lua|json|toml|md|sh|rs|ts|js|html|css|c|cpp))' \
    | head -n1 || true)

  if [[ -n "$file" ]]; then
    icon=$(get_icon_for_file "$file")
    label=$(basename "$file")

  # Yazi?
  elif echo "$all_descendants" | xargs ps -o cmd= | grep -q yazi; then
    icon=""
    label="yazi"

  # Fallback: Terminal erkannt
  else
    shell=$(echo "$all_descendants" | xargs ps -o comm= | grep -E 'zsh|bash|fish' | head -n1 || echo "shell")
    icon=""
    label="$shell"
  fi

# Firefox (oder andere Apps direkt erkennen)
elif [[ "$class" =~ firefox ]]; then
  icon=""
  label="firefox"
fi

# Max. Länge
maxlen=50
if [[ ${#label} -gt $maxlen ]]; then
  label="${label:0:$maxlen}…"
fi

# Ausgabe
echo "$icon $label"

