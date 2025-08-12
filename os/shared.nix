{ ... }:
{
  environment.shellAliases = {
    "cat" = "bat";
    "ls" = "lsd";
    "cd" = "z";
    "cls" = "clear";
    "vog" = "gh repo view --web";
    "his" = "history | grep";
    "cap" = "gemini -p \"commit and push\" -y";
  };

  environment.extraInit = ''
    export PATH="$HOME/.local/bin:$PATH"
    eval "$(fnm env)"
  '';

  environment.variables = {
    NEXT_TELEMETRY_DISABLED = "1";
    NUXT_TELEMETRY_DISABLED = "1";

    # shell config
    EDITOR = "nvim";

    # oh-my-zsh config
    ENABLE_CORRECTION = "true";
    HYPHEN_INSENSITIVE = "true";
  };
}
