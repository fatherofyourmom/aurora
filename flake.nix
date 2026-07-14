{
  description = "Aurora - A modern, modular NixOS desktop built with Hyprland, Home Manager and Quickshell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      # Shared theme configuration
      auroraTheme = {
        colors = {
          background = "#111318";
          surface = "#181C23";
          primary = "#7AA2F7";
          accent = "#CBA6F7";
          text = "#E6EDF3";
        };

        fonts = {
          sans = "Inter";
          mono = "JetBrains Mono Nerd Font";
          display = "Space Grotesk";
          emoji = "Noto Emoji";
        };

        appearance = {
          radius = 12;
          gaps = 8;
          opacity = 0.9;
          blur = true;
        };
      };

      # Base modules for all hosts
      baseModules = [
        ./modules/system
        ./modules/desktop
        ./modules/services
        ./modules/hardware
        ./modules/shared

        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix
      ];

      # Special args passed to all modules
      specialArgs = {
        inherit auroraTheme;
        inherit self;
      };

    in {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        modules = baseModules ++ [
          ./hosts/default
        ];
      };

      # Development utilities
      devShells.${system}.default = nixpkgs.legacyPackages.${system}.mkShell {
        packages = with pkgs; [
          nil
          nixfmt-classic
          git
        ];
      };
    };
}
