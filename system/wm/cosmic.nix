{ config, pkgs, lib, ... }:

{
  # Enable Cosmic Desktop
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  services.geoclue2.enable = true;

  environment.systemPackages = with pkgs; [
    cosmic-bg
    cosmic-applets
    cosmic-files
    cosmic-panel
    cosmic-greeter
    cosmic-comp
    cosmic-randr
    cosmic-session
    cosmic-launcher
    cosmic-applibrary
    cosmic-notifications
    cosmic-settings-daemon
    cosmic-icons
    cosmic-tasks
    cosmic-settings
    cosmic-wallpapers
    cosmic-protocols
    cosmic-ext-calculator
    cosmic-ext-forecast    
    cosmic-ext-tasks
    cosmic-ext-tweaks
    cosmic-reader
    cosmic-screenshot
    quick-webapps
  ];

}
