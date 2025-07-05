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

    # devops
    ansible
    minikube
  ];
  home.file = {
    "./.config/lvim/config.lua".source = "${dotfiles}/.config/lvim/config.lua";
  };
}
