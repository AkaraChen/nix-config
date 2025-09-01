{pkgs, ...}: {
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
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      aws = {
        symbol = "  ";
      };
      buf = {
        symbol = " ";
      };
      c = {
        symbol = " ";
      };
      conda = {
        symbol = " ";
      };
      dart = {
        symbol = " ";
      };
      directory = {
        read_only = " 󰌾";
      };
      docker_context = {
        symbol = " ";
      };
      elixir = {
        symbol = " ";
      };
      elm = {
        symbol = " ";
      };
      git_branch = {
        symbol = " ";
      };
      golang = {
        symbol = " ";
      };
      hostname = {
        ssh_symbol = " ";
      };
      java = {
        symbol = " ";
      };
      lua = {
        symbol = " ";
      };
      memory_usage = {
        symbol = "󰍛 ";
      };
      nix_shell = {
        symbol = " ";
      };
      nodejs = {
        symbol = " ";
      };
      os = {
        disabled = true;
        symbols = {
          Alpine = " ";
          Android = " ";
          Arch = " ";
          Debian = " ";
          Fedora = " ";
          FreeBSD = " ";
          Gentoo = " ";
          Linux = " ";
          Macos = " ";
          Manjaro = " ";
          Mint = " ";
          NixOS = " ";
          openSUSE = " ";
          Ubuntu = " ";
          Unknown = " ";
          Windows = "󰍲 ";
        };
      };
      package = {
        symbol = "󰏗 ";
      };
      python = {
        symbol = " ";
      };
      ruby = {
        symbol = " ";
      };
      rust = {
        symbol = " ";
      };
      scala = {
        symbol = " ";
      };
      username = {
        show_always = true;
      };
    };
  };
}
