{ dotfiles, ... }:

{
  home.stateVersion = "24.05";
  home.username = "akrc";
  home.homeDirectory = "/home/akrc";

  home.files = {
    "./.config/hyprland/hyprland.conf".source = "${dotfiles}/.config/hyprland/hyprland.conf";
  };
}
