{
  description = "My personal NixOS/Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    dotfiles = {
      url = "github:akarachen/dotfiles/6dabce6d34e55c2af2e4461314f02155ffad6992";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, dotfiles, ... }@inputs: {
    homeConfigurations.akrc = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.aarch64-linux;
      modules = [
        ./home/home.nix
      ];
      extraSpecialArgs = { inherit dotfiles; };
    };
  };
}
