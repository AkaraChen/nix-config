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
    go

    # devops
    ansible

    # tools
    lazygit
  ];
  home.file = {
    "./.config/lvim/config.lua".source = "${dotfiles}/.config/lvim/config.lua";
    ".nuxtrc".source = "${dotfiles}/.nuxtrc";
    ".global.gitignore".source = "${dotfiles}/.global.gitignore";
  };
}
