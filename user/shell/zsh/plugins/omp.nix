{ config, lib, pkgs, ... }:

let
  # dein Prompt-Layout ohne palette
  templateBase = ../omp/template-base16.toml;
  renderedPath = "${config.xdg.configHome}/oh-my-posh/themes/generated.omp.toml";
in {
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
  };

  # dynamische Farben bei Aktivierung einfügen
  home.activation.generateOMP = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    TEMPLATE="${templateBase}"
    OUT="${renderedPath}"

    mkdir -p "$(dirname "$OUT")"

    if [ -f /etc/stylix/colors.toml ]; then
      echo "[OMP] Generating Stylix base16 palette into OMP template..."

      {
        echo 'version = 3'
        echo 'final_space = true'
        echo ''
        echo '[palette]'
        grep -E '^base[0-9A-Fa-f]+ *= *' /etc/stylix/colors.toml \
          | sed -E 's/ *= */ = "/; s/"//g; s/$/"/'
        echo ''
        cat "$TEMPLATE"
      } > "$OUT"
    else
      echo "[OMP] Warning: /etc/stylix/colors.toml not found – skipping generation." >&2
    fi
  '';
}

