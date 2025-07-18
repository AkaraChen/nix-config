{ dotfiles, ... }:

{
  home.stateVersion = "24.05";
  home.username = "akrc";
  home.homeDirectory = "/home/akrc";

  home.file = {
    "./.config/hyprland/hyprland.conf".source = "${dotfiles}/.config/hyprland/hyprland.conf";
  };
}
