{
  description = "My personal NixOS/Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nix darwin
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    dotfiles = {
      url = "github:akarachen/dotfiles/58701eb5abe3127fd09e8def3b541c79bbbf0e3b";
      flake = false;
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
    };
  };

  outputs = { nixpkgs, home-manager, dotfiles, nix-darwin, stylix, ... }@inputs: {
    # home manager configurations
    homeConfigurations.linux = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.aarch64-linux;
      modules = [
        ./home/home.nix
        ./home/code.nix
        ./home/shell.nix
      ];
      extraSpecialArgs = { inherit dotfiles; };
    };
    homeConfigurations.x86_64-linux = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./home/home.nix
        ./home/code.nix
        ./home/shell.nix
      ];
      extraSpecialArgs = { inherit dotfiles; };
    };
    homeConfigurations.darwin = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      modules = [
        ./home/home-mac.nix
        ./home/code.nix
        ./home/shell.nix
      ];
      extraSpecialArgs = { inherit dotfiles; };
    };

    # darwin system configuration
    darwinConfigurations."AkrMac" = nix-darwin.lib.darwinSystem {
      modules = [
        ./os/darwin.nix
      ];
    };

    # nixos system configuration
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      modules = [
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix
        ./os/configuration.nix
        {
          home-manager = {
            extraSpecialArgs = {
              inherit dotfiles;
            };
            users.akrc = {
              imports = [
                ./home/home.nix
                ./home/code.nix
                ./home/shell.nix
                stylix.homeModules.stylix
                ./home/desktop.nix
              ];
            };
          };
        }
      ];
      specialArgs = { inherit dotfiles; };
    };
  };
}
