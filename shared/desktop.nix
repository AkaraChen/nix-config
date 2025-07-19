{ pkgs, dotfiles, ... }:

{
    home.packages = with pkgs; [
        nerd-fonts.zed-mono
        ghostty
        rofi
        waybar
        mako
    ];
    wayland.windowManager.sway.enable = true;
    home.file = {
        ".config/sway".source = "${dotfiles}/.config/sway";
    };
}
