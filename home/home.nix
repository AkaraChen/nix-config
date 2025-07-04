{ config, pkgs, ... }:

{
  home.stateVersion = "24.05";
  home.username = "akrc";
  home.homeDirectory = "/home/akrc";
  home.packages = [
    pkgs.stow
    pkgs.neofetch
    pkgs.git
    pkgs.gh
  ];

}

