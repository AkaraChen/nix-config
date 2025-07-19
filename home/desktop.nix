{ pkgs, catppuccin, ... }:

{
    wayland.windowManager.hyprland.enable = true;
    catppuccin = {
        enable = true;
    };
}
