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
      url = "github:akarachen/dotfiles/3bafbf73834a374cb88ed5e089d380da206d583a";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, dotfiles, nix-darwin, ... }@inputs: {
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
  };
}
