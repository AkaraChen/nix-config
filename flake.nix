{
  description = "My personal NixOS/Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    dotfiles = {
      url = "github:akarachen/dotfiles/1c92c3e338b6fbc4714bc3bcdb1b851be7f4f931";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, dotfiles, ... }@inputs: {
    homeConfigurations.linux = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.aarch64-linux;
      modules = [
        ./home/home.nix
        ./home/code.nix
        ./home/shell.nix
      ];
      extraSpecialArgs = { inherit dotfiles; };
    };
    homeConfigurations.darwin = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-darwin;
      modules = [
        ./home/home-mac.nix
        ./home/code.nix
        ./home/shell.nix
      ];
      extraSpecialArgs = { inherit dotfiles; };
    };
  };
}
