{
  description = "The Ultimate Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager-stable = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager-unstable = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    ghostty.url = "github:ghostty-org/ghostty";
    cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    stylix.url = "github:danth/stylix";
    nixvim.url = "github:nix-community/nixvim";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager-stable, home-manager-unstable, cosmic, ghostty, stylix, nixvim, zen-browser, ... }:
  let
    zenOverlay = final: prev: {
      zen-browser = zen-browser.packages.${final.system}.default;
    };

    system = "x86_64-linux";

    # ---- SYSTEM SETTINGS ---- #
    systemSettings = {
      system = system;
      hostname = "main";
      profile = "main";  # Dynamische Profilwahl
      timezone = "Europe/Berlin";
      locale = "de_DE.UTF-8";
      grubDevice = "";
      gpuType = "nvidia";
    };

    # ----- USER SETTINGS ----- #
    userSettings = rec {
      username = "dengo123";
      name = "Deniz";
      email = "deniz060198@hotmail.com";
      dotfilesDir = "~/.dotfiles";
      theme = "everforest";
      wm = "cosmic";
      browser = "";
      term = "ghostty";
      shell = "zsh";
    #  font = "Intel One Mono";
    #  fontPkg = pkgs.intel-one-mono;
      editor = "neovim";
    };

    # ----- PACKAGES ----- #
    overlays = [ cosmic.overlay zenOverlay ];
    lib = nixpkgs.lib;

    # Definiere stable und unstable separat
    pkgs-stable = import inputs.nixpkgs {
      system = systemSettings.system;
      config = {
        allowUnfree = true;
        overlays = overlays;
      };
    };

    pkgs-unstable = import inputs.nixpkgs-unstable {
      system = systemSettings.system;
      config = {
        allowUnfree = true;
        overlays = overlays;
      };
    };

  in {
    nixosConfigurations = {
      system = lib.nixosSystem {
        system = systemSettings.system;
        modules = [
          ./profiles/${systemSettings.profile}/configuration.nix
          {
            nix.settings = {
              substituters = [ "https://cosmic.cachix.org/" ];
              trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
            };
          }
          cosmic.nixosModules.default
        ];
        specialArgs = specialArgs;
      };
    };

    homeConfigurations = {
      user = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./profiles/${systemSettingspprofile}/home.nix
          nixvim.homeManagerModules.nixvim
        ];
        extraSpecialArgs = specialArgs;
      };
    };
  };
}

