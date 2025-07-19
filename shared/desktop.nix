{ pkgs, ... }:

{
    home.packages = with pkgs; [
        nerd-fonts.zed-mono
        ghostty
        rofi
        waybar
        mako
    ];
}
