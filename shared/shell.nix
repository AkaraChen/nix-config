{ pkgs, ... }:

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

  environment.shellAliases = {
    "cat" = "bat";
    "ls" = "lsd";
    "cd" = "z";
    "cls" = "clear";
    "vog" = "gh repo view --web";
    "his" = "history | grep";
  };

  environment.extraInit = ''
    export PATH="$HOME/.local/bin:$PATH"
  '';

  environment.variables = {
    NEXT_TELEMETRY_DISABLED = 1;
    NUXT_TELEMETRY_DISABLED = 1;

    # shell config
    EDITOR = "nvim";

    # oh-my-zsh config
    ENABLE_CORRECTION = "true";
    HYPHEN_INSENSITIVE = "true";
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "afowler";
      plugins = [
        "git"
        "golang"
        "rust"
        "node"
        "npm"
        "python"
        "brew"
      ];
    };
    interactiveShellInit = ''
      eval "$(fnm env)"
      eval "$(zoxide init zsh)"
    '';
  };

  programs.starship = {
    enable = true;
    settings = { };
  };
}
