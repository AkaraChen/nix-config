{ pkgs, dotfiles, ... }:

{
  home.packages = [
    pkgs.git
    pkgs.gh
    pkgs.neovim
    pkgs.lunarvim
  ];
  home.file = {
    "./.config/lvim/config.lua".source = "${dotfiles}/.config/lvim/config.lua";
  };
}
