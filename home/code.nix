{ pkgs, dotfiles, ... }:

{
  home.packages = with pkgs; [
    git
    gh
    neovim
    lunarvim

    # languages tools
    rustup
    uv
    fnm
    bun

    # devops
    ansible
    minikube

    # tools
    lazygit
  ];
  home.file = {
    "./.config/lvim/config.lua".source = "${dotfiles}/.config/lvim/config.lua";
  };
}
