{ dotfiles, ... }:

{
  home.stateVersion = "24.05";
  home.username = "akrc";
  home.homeDirectory = "/home/akrc";

  home.file = {
    "./.config/hypr/hyprland.conf".source = "${dotfiles}/.config/hypr/hyprland.conf";
  };
}
