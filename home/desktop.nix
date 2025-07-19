{ pkgs, catppuccin, ... }:

{
    catppuccin = {
        enable = true;
        flavor = "mocha";
        cursors.enable = true;
    };
    home.packages = with pkgs; [
        kitty
        waybar
        kitty
        firefox
        nerd-fonts.im-writing
    ];

    wayland.windowManager.hyprland.enable = true;
}
