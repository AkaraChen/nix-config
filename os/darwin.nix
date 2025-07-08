{ ... }:

{
  nix.settings.experimental-features = "nix-command flakes";
  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";

  # system settings
  system.keyboard.remapCapsLockToEscape = true;

  # brew settings
  homebrew.enabled = true;
  homebrew.brews = [
    "font-zed-mono-nerd-font"
    "font-geist-mono-nerd-font"
    "font-fira-code-nerd-font"
  ];
  homebrew.casks = [
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
  ];
}
