{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghostty
    google-chrome
    hoppscotch
    jetbrains-toolbox
    obsidian
    telegram
    thunderbird
    zed
    github-desktop
  ];
}
