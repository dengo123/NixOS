{ lib, userSettings, themeDir, ... }:

let
  colors = lib.importTOML "${themeDir}/colors.toml";
in ''
  * {
    font-family: "${userSettings.font}";
    font-size: 13px;
  }

  @define-color base00 ${colors.base00};
  @define-color base01 ${colors.base01};
  @define-color base02 ${colors.base02};
  @define-color base03 ${colors.base03};
  @define-color base05 ${colors.base05};
  @define-color base08 ${colors.base08};
  @define-color base0D ${colors.base0D};

  .notification {
    background-color: @base01;
    color: @base05;
    border: 2px solid @base0D;
    border-radius: 10px;
    padding: 10px;
    margin: 6px;
    box-shadow: none;
  }

  .notification-content,
  .notification-background {
    background: transparent;
    border: none;
    box-shadow: none;
    padding: 0;
    margin: 0;
  }

  .notification-critical {
    border: 2px solid @base08;
  }

  .close-button {
    background-color: @base08;
    color: @base00;
    border-radius: 6px;
  }

  .notification-action {
    background: @base02;
    border: 1px solid @base0D;
    color: @base05;
    border-radius: 6px;
  }

  .notification-action:hover {
    background: @base0D;
    color: @base00;
  }

  .widget-title > label {
    font-weight: bold;
    font-size: 1.2em;
  }

  .control-center {
    background-color: @base00;
    border: 2px solid @base0D;
    border-radius: 10px;
    padding: 10px;
  }

  .control-center .notification-row .notification-background {
    background: transparent;
    border: none;
    box-shadow: none;
  }

  /*********** MENÜPUNKTE (Power, Screenshot etc.) ***********/
  .widget-menubar button {
    background-color: transparent;
    color: @base05;
    padding: 6px 10px;
    margin: 4px 0;
    border-radius: 8px;
    transition: background-color 0.2s ease;
  }

  .widget-menubar button:hover {
    background-color: @base02;
  }

  .widget-menubar button:active {
    background-color: @base0D;
    color: @base00;
  }

  /*********** DND Toggle Styling ***********/
  .widget-dnd > switch {
    background-color: @base01;
    border: 1px solid @base0D;
    border-radius: 20px;
    padding: 2px;
    min-width: 40px;
    min-height: 20px;
  }

  .widget-dnd > switch slider {
    background-color: @base05;
    border-radius: 8px;
    min-width: 16px;
    min-height: 16px;
    margin: 2px;
  }

  .widget-dnd > switch:checked {
    background-color: @base0D;
  }
''

