{ ... }:

{
  nix.settings.experimental-features = "nix-command flakes";
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.primaryUser = "akrc";

  # system settings
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  # brew settings
  homebrew = {
    enable = true;
    brews = [];
    casks = [
      "adguard"
      "orbstack"
      "chatwise"
      "rectangle"
      "ghostty"
      "google-chrome"
      "hoppscotch"
      "jetbrains-toolbox"
      "thunderbird"
      "zed"
      "github"
      "windsurf"
      "logseq"
      "font-zed-mono-nerd-font"
      "font-geist-mono-nerd-font"
      "font-fira-code-nerd-font"
      "figma"
      "zotero"
    ];
    masApps = {
      "Reeder classic" = 1529445840;
    };
  };
}
