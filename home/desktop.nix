{ pkgs, catppuccin, ... }:

{
    wayland.windowManager.hyprland.enable = true;
    catppuccin = {
        enable = true;
        hyprland = {
            enable = true;
        };
        waybar = {
            enable = true;
        };
        kitty = {
            enable = true;
        };
    };
}
