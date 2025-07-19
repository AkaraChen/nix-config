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

    # setup gnome for display manager
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
    wayland.windowManager.hyprland.enable = true;
}
