{
  description = "The Ultimate Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty.url = "github:ghostty-org/ghostty";
    
    cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    
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

  outputs = inputs@{ self, nixpkgs, home-manager, cosmic, ghostty, stylix, nixvim, hyprland, hyprland-plugins, ... }:
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
    userSettings = rec {
      username = "dengo123";
      name = "Deniz";
      email = "deniz060198@hotmail.com";
      theme = "everforest";
      wallpaper = ./themes/wallpapers/nixos_waves.png;
      font = "Intel One Mono";
      fontPkg = pkgs.intel-one-mono;
      wm = "cosmic";
      browser = "";
      term = "ghostty";
      shell = "zsh";
      editor = "nvim";
    };

    # ----- PACKAGES ----- #
    overlays = [ cosmic.overlay ];
    lib = nixpkgs.lib;

    pkgs = import inputs.nixpkgs {
      system = systemSettings.system;
      config = {
        allowUnfree = true;
        overlays = overlays;
      };
    };

    specialArgs = if userSettings.wm == "cosmic" then
      { inherit systemSettings userSettings inputs; }
    else
      { inherit systemSettings userSettings inputs pkgs; };

  in {
    nixosConfigurations = {
      system = lib.nixosSystem {
        system = systemSettings.system;
        modules = [
          ./profiles/${systemSettings.profile}/configuration.nix
          cosmic.nixosModules.default
          {
            nix.settings = {
              substituters = [ "https://cosmic.cachix.org/" ];
              trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
            };
          }
        ];
        specialArgs = specialArgs;
      };
    };

    homeConfigurations = {
      user = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./profiles/${systemSettings.profile}/home.nix
          nixvim.homeManagerModules.nixvim
        ];
        extraSpecialArgs = specialArgs;
      };
    };
  };
}

