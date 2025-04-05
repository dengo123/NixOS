{ lib, themeDir }:

let
  raw = lib.importTOML "${themeDir}/colors.toml";

  # Map für Hex -> Dezimal
  hexMap = {
    "0" = 0;  "1" = 1;  "2" = 2;  "3" = 3;
    "4" = 4;  "5" = 5;  "6" = 6;  "7" = 7;
    "8" = 8;  "9" = 9;  "a" = 10; "A" = 10;
    "b" = 11; "B" = 11; "c" = 12; "C" = 12;
    "d" = 13; "D" = 13; "e" = 14; "E" = 14;
    "f" = 15; "F" = 15;
  };

  # Konvertiert zwei hex chars zu dezimal
  hexPairToDec = pair:
    let
      hi = lib.substring 0 1 pair;
      lo = lib.substring 1 1 pair;
    in hexMap.${hi} * 16 + hexMap.${lo};

  hexToRgba = hex: alpha:
    let
      hex' = lib.removePrefix "#" hex;
      r = hexPairToDec (lib.substring 0 2 hex');
      g = hexPairToDec (lib.substring 2 2 hex');
      b = hexPairToDec (lib.substring 4 2 hex');
    in "rgba(${toString r}, ${toString g}, ${toString b}, ${toString alpha})";

  rgba = alpha: lib.mapAttrs (_: v: hexToRgba v alpha) raw;

in {
  inherit hexToRgba rgba;
}

