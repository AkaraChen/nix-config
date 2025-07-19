{ pkgs, catppuccin, ... }:

{
    wayland.windowManager.hyprland.enable = true;
    catppuccin = {
        enable = true;
        cursors.enable = true;
        cache.enable = true;
    };
}
