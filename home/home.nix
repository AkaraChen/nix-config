{ config, pkgs, programs, ... }:

{
  home.stateVersion = "24.05";
  home.username = "akrc";
  home.homeDirectory = "/home/akrc";
  home.packages = [
    pkgs.stow
    pkgs.neofetch
    pkgs.git
    pkgs.gh
    pkgs.which
    pkgs.bat
    pkgs.lsd
    pkgs.fzf
    pkgs.zoxide
  ];
  programs.zsh = {
    enable = true;
  };
}
