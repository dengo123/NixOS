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
    stylix.url = "github:danth/stylix";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, cosmic, ghostty, stylix, nixvim, ... }:
  let
    system = "x86_64-linux";

    # ---- SYSTEM SETTINGS ---- #
    systemSettings = {
      system = system;
      hostname = "main";
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
      dotfilesDir = "~/.dotfiles";
      theme = "everforest";
      wm = "cosmic";
      browser = "";
      term = "ghostty";
      shell = "zsh";
    #  font = "Intel One Mono";
    #  fontPkg = pkgs.intel-one-mono;
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
          ./profiles/${systemSettings.profile}/home.nix
          nixvim.homeManagerModules.nixvim
        ];
        extraSpecialArgs = specialArgs;
      };
    };
  };
}

