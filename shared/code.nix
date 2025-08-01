{ pkgs, dotfiles, ... }:

{
  home.packages = with pkgs; [
    git
    gh
    neovim
    lunarvim

    # languages tools
    uv
    fnm
    bun
    go
    deno
    nixd
    nil
    chicken # Scheme compiler

    # devops
    ansible

    # tools
    lazygit
    caddy

    # node.js tools
    nodePackages.vercel
    nodePackages.serve
  ];
  home.file = {
    "./.config/lvim/config.lua".source = "${dotfiles}/.config/lvim/config.lua";
    ".nuxtrc".source = "${dotfiles}/.nuxtrc";
    ".global.gitignore".source = "${dotfiles}/.global.gitignore";
  };
}
