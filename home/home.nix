{ pkgs, dotfiles, ... }:

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
    pkgs.neovim
    pkgs.lunarvim
  ];
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
    };
  };
  programs.gh = {
    enable = true;
  };
  home.file = {
    ".zshrc".source = "${dotfiles}/.zshrc";
    "starship.toml".source = "${dotfiles}/starship.toml";
  };
}
