{ config, pkgs, programs, dotfiles, ... }:

{
  home.stateVersion = "24.05";
  home.username = "akrc";
  home.homeDirectory = "/home/akrc";
  home.packages = [
    pkgs.stow
    pkgs.neofetch
    pkgs.git
    pkgs.gh
    pkgs.which
    pkgs.bat
    pkgs.lsd
    pkgs.fzf
    pkgs.zoxide
    pkgs.fnm
    pkgs.starship
  ];
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
    };
  };
  home.file = {
    ".zshrc".source = "${dotfiles}/.zshrc";
    "starship.toml".source = "${dotfiles}/starship.toml";
    ".gitconfig".source = "${dotfiles}/.gitconfig";
    ".global.gitignore".source = "${dotfiles}/.global.gitignore";
  };
}
