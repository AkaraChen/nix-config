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
      nix-darwin,
      stylix,
      rust-overlay,
      ...
    }:
    let
      rustModule =
        { pkgs, ... }:
        {
          nixpkgs.overlays = [ rust-overlay.overlays.default ];
          environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
        };
    in
    {
      # home manager configurations
      homeConfigurations =
        let
          linuxModules = [
            ./home/home.nix
            ./home/shared/code.nix
            ./home/shared/shell.nix
          ];
        in
        {
          linux = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.aarch64-linux;
            modules = linuxModules;
          };
          "x86_64-linux" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            modules = linuxModules;
          };
          "linux-gui" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.aarch64-linux;
            modules = linuxModules ++ [ ./home/shared/desktop.nix ];
          };
          darwin = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.aarch64-darwin;
            modules = [
              ./home/home-mac.nix
              ./home/shared/code.nix
              ./home/shared/shell.nix
            ];
          };
        };

      # darwin system configuration
      darwinConfigurations."AkrMac" = nix-darwin.lib.darwinSystem {
        modules = [
          ./os/darwin.nix
          rustModule
          ./os/shared.nix
        ];
      };

      # nixos system configuration
      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        modules = [
          ./os/shared.nix
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
              users.akrc = {
                imports = [
                  ./home/home.nix
                  ./home/shared/code.nix
                  ./home/shared/shell.nix
                  ./home/shared/desktop.nix
                ];
              };
            };
          }
        ];
      };
    };
}
