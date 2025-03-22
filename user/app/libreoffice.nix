{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libreoffice
  ];

  xdg.desktopEntries.libreoffice-writer = {
    name = "LibreOffice Writer";
    exec = "libreoffice --writer";
    icon = "libreoffice-writer";
    type = "Application";
    comment = "LibreOffice Textverarbeitung";
    categories = [ "Office" ];
  };

  xdg.desktopEntries.libreoffice-calc = {
    name = "LibreOffice Calc";
    exec = "libreoffice --calc";
    icon = "libreoffice-calc";
    type = "Application";
    comment = "LibreOffice Tabellenkalkulation";
    categories = [ "Office" ];
  };

  xdg.desktopEntries.libreoffice-impress = {
    name = "LibreOffice Impress";
    exec = "libreoffice --impress";
    icon = "libreoffice-impress";
    type = "Application";
    comment = "LibreOffice Präsentationen";
    categories = [ "Office" ];
  };

  xdg.desktopEntries.libreoffice-draw = {
    name = "LibreOffice Draw";
    exec = "libreoffice --draw";
    icon = "libreoffice-draw";
    type = "Application";
    comment = "LibreOffice Zeichenprogramm für Diagramme und Layouts";
    categories = [ "Graphics" "Office" ];
  };

  xdg.desktopEntries.libreoffice-math = {
    name = "LibreOffice Math";
    exec = "libreoffice --math";
    icon = "libreoffice-math";
    type = "Application";
    comment = "LibreOffice Formel-Editor";
    categories = [ "Education" "Science" "Office" ];
  };

  xdg.desktopEntries.libreoffice-base = {
    name = "LibreOffice Base";
    exec = "libreoffice --base";
    icon = "libreoffice-base";
    type = "Application";
    comment = "LibreOffice Datenbankverwaltung";
    categories = [ "Database" "Office" ];
  };
}

