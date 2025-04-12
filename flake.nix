{
  description = "The Ultimate Flake";

  outputs = inputs@{ nixpkgs, home-manager, ghostty, stylix, nixvim, hyprland, hyprland-plugins, ... }:
  let
    system = "x86_64-linux";

    # ---- SYSTEM SETTINGS ---- #
    systemSettings = {
      system = system;
      hostname = "NixOS";
      profile = "main";
      timezone = "Europe/Berlin";
      locale = "de_DE.UTF-8";
      gpuType = "nvidia";
    };

    # ----- USER SETTINGS ----- #
    userSettings = {
      username = "dengo123";
      name = "Deniz";
      email = "deniz060198@hotmail.com";
      theme = "catppuccin-mocha";
      font = "Intel One Mono";
      fontPkg = pkgs.intel-one-mono;
      cursor = "Adwaita";
      cursorPkg = pkgs.adwaita-icon-theme;
      cursorSize = 22;
      wm = "hyprland";
      browser = "firefox";
      term = "ghostty";
      shell = "zsh";
      editor = "nvim";
    };

    # ----- PACKAGES ----- #
    overlays = [];
    lib = nixpkgs.lib;

    pkgs = import inputs.nixpkgs {
      system = systemSettings.system;
      config = {
        allowUnfree = true;
        overlays = overlays;
      };
    };

    theme = lib.importTOML ./themes/${userSettings.theme}/colors.toml;

    specialArgs = {
      inherit systemSettings userSettings inputs pkgs stylix theme;
    };

  in {
    nixosConfigurations = {
      system = lib.nixosSystem {
        system = systemSettings.system;
        modules = [
          ./profiles/${systemSettings.profile}/configuration.nix
        ];
        specialArgs = specialArgs;
      };
    };

    homeConfigurations = {
      user = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./profiles/${systemSettings.profile}/home.nix
        ];
        extraSpecialArgs = specialArgs;
      };
    };
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty.url = "github:ghostty-org/ghostty";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };
}

