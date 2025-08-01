{
  description = "My personal NixOS/Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nix darwin
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    dotfiles = {
      url = "github:akarachen/dotfiles/8e8a25f2d0fe3c96f1afda13030935c13ac72892";
      flake = false;
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      dotfiles,
      nix-darwin,
      stylix,
      rust-overlay,
      ...
    }:
    let
      rustModule = { pkgs, ... }: {
        nixpkgs.overlays = [ rust-overlay.overlays.default ];
        environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
      };
    in
    {
      # home manager configurations
      homeConfigurations =
        let
          sharedArgs = {
            inherit dotfiles;
            inherit rust-overlay;
          };
          linuxModules = [
            ./home/home.nix
            ./shared/code.nix
            ./shared/shell.nix
          ];
        in
        {
          linux = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.aarch64-linux;
            modules = linuxModules;
            extraSpecialArgs = sharedArgs;
          };
          "x86_64-linux" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            modules = linuxModules;
            extraSpecialArgs = sharedArgs;
          };
          "linux-gui" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.aarch64-linux;
            modules = linuxModules ++ [ ./shared/desktop.nix ];
            extraSpecialArgs = sharedArgs;
          };
          darwin = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.aarch64-darwin;
            modules = [
              ./home/home-mac.nix
              ./shared/code.nix
              ./shared/shell.nix
            ];
            extraSpecialArgs = sharedArgs;
          };
        };

      # darwin system configuration
      darwinConfigurations."AkrMac" = nix-darwin.lib.darwinSystem {
        modules = [
          ./os/darwin.nix
          rustModule
        ];
      };

      # nixos system configuration
      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        modules = [
          stylix.nixosModules.stylix
          (
            { pkgs, ... }:
            {
              stylix.enable = true;
              stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
            }
          )
          rustModule
          ./os/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = {
                inherit dotfiles;
              };
              users.akrc = {
                imports = [
                  ./home/home.nix
                  ./shared/code.nix
                  ./shared/shell.nix
                  ./shared/desktop.nix
                ];
              };
            };
          }
        ];
      };
    };
}
