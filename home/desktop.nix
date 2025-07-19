{ pkgs, catppuccin, ... }:

{
    wayland.windowManager.hyprland.enable = true;
    catppuccin = {
        waybar.enable = true;
        kitty.enable = true;
        hyprland.enable = true;
        neovim.enable = true;
    };
}
