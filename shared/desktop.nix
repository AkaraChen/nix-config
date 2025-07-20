{ pkgs, dotfiles, ... }:

{
    home.packages = with pkgs; [
        nerd-fonts.zed-mono
        ghostty
    ];
    
}
