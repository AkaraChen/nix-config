{pkgs, ...}: {
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
    ruby
    lean4

    # haskell (minimal for learning)
    haskell.compiler.ghc98
    haskell-language-server
    stack

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
    "./.config/lvim/config.lua".source = ../../dotfiles/.config/lvim/config.lua;
    ".global.gitignore".source = ../../dotfiles/.global.gitignore;
  };

  programs.git = {
    enable = true;
    userName = "AkaraChen";
    userEmail = "akarachen@outlook.com";
    extraConfig = {
      filter.lfs = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = true;
      };
      core = {
        autocrlf = false;
        eol = "lf";
        excludesfile = "~/.global.gitignore";
      };
      column = {
        ui = "auto";
      };
      branch = {
        sort = "-committerdate";
      };
      tag = {
        sort = "version:refname";
      };
      init = {
        defaultBranch = "main";
      };
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };
      push = {
        default = "simple";
        autoSetupRemote = true;
        followTags = true;
      };
      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };
      help = {
        autocorrect = "prompt";
      };
      rebase = {
        autoSquash = true;
        autoStash = true;
        updateRefs = true;
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
      merge = {
        conflictstyle = "zdiff3";
      };
      pull = {
        rebase = true;
      };
    };
  };
}
