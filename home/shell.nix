{ pkgs, dotfiles, ... }:

{
  home.stateVersion = "24.05";
  home.username = "akrc";
  home.homeDirectory = "/home/akrc";
  home.packages = [
    pkgs.neofetch
    pkgs.which
    pkgs.bat
    pkgs.lsd
    pkgs.fzf
    pkgs.zoxide
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
  };
}
