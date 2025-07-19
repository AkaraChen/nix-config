{ pkgs, dotfiles, ... }:

{
    home.packages = with pkgs; [
        nerd-fonts.zed-mono
        ghostty
        rofi
        waybar
        mako
    ];
    home.file = {
        ".config/sway".source = "${dotfiles}/.config/sway";
    };
}
