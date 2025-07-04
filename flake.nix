{
  description = "My personal NixOS/Home Manager configuration";

  inputs = {
    # Nixpkgs 提供 Nix 软件包集合
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # 使用最新的不稳定版本，你也可以指定稳定分支如 "nixos-23.11"

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # 确保 Home Manager 使用与 flake 相同的 nixpkgs 版本
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    # 定义 Home Manager 配置
    homeConfigurations.akrc = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.aarch64-linux; # 或者根据你的系统架构更改，例如 aarch64-darwin
      modules = [
        ./home/home.nix
      ];
    };
  };
}

