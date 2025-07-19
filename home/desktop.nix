{ pkgs, catppuccin, ... }:

{
    home.packages = with pkgs; [
        waybar
        kitty
        hyprland
        neovim
    ];
    wayland.windowManager.hyprland.enable = true;
    catppuccin = {
        enable = true;
    };
}
