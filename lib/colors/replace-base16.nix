{ lib, palette }:

str: lib.strings.replaceStrings
  [ "p:base00" "p:base01" "p:base02" "p:base03" "p:base04" "p:base05"
    "p:base06" "p:base07" "p:base08" "p:base09" "p:base0A" "p:base0B"
    "p:base0C" "p:base0D" "p:base0E" "p:base0F"
  ]
  [ palette.base00 palette.base01 palette.base02 palette.base03
    palette.base04 palette.base05 palette.base06 palette.base07
    palette.base08 palette.base09 palette.base0A palette.base0B
    palette.base0C palette.base0D palette.base0E palette.base0F
  ]
  str

