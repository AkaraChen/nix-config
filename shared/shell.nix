{ pkgs, dotfiles, ... }:

{
  home.packages = with pkgs; [
    # shell setups
    starship

    # cli tools
    which
    bat
    lsd
    fzf
    zoxide
    hyperfine
    just
    neofetch
  ];

  programs.zsh = {
    # will conflict with home.file.[".zshrc"]
    # enable = true;
    oh-my-zsh = {
      enable = true;
    };
  };
  home.file = {
    ".zshrc".source = "${dotfiles}/.zshrc";
    "starship.toml".source = "${dotfiles}/starship.toml";
  };
}
