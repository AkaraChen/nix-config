{ config, pkgs, ... }:

{
  # 声明 Home Manager 版本
  home.stateVersion = "24.05"; # 请根据你的 Nixpkgs 版本或当前年份填写，例如 "24.05" 或 "23.11"
  home.username = "akrc";
  home.homeDirectory = "/home/akrc";

  # 定义你想要安装的软件包
  home.packages = [
    pkgs.stow
    pkgs.neofetch
    pkgs.git
    pkgs.gh
  ];

}

