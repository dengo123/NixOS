{ config, lib, pkgs, ... }:

let
  templatePath = ../omp/template.toml;
  outputPath = "${config.xdg.configHome}/oh-my-posh/themes/generated.omp.toml";
in {
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
  };

  home.activation.generateOMP = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    TEMPLATE="${templatePath}"
    OUT="${outputPath}"

    mkdir -p "$(dirname "$OUT")"

    if [ -f /etc/stylix/colors.toml ]; then
      echo "[OMP] Generating prompt from Stylix colors..."

      export $(grep -E '^base[0-9A-F]+ *= *' /etc/stylix/colors.toml \
        | sed -E 's/"//g; s/ *= */=#/g')

      sed -E 's/\{\{([a-zA-Z0-9]+)\}\}/\$\1/g' "$TEMPLATE" | envsubst > "$OUT"
    else
      echo "[OMP] Warning: /etc/stylix/colors.toml not found – skipping generation." >&2
    fi
  '';
}

