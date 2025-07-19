{ ... }:

{
  nix.settings.experimental-features = "nix-command flakes";

  # Garbage Collection
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 30d";
  };

  # Optimize Nix store
  nix.optimise.automatic = true;
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.primaryUser = "akrc";

  # system settings
  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyleSwitchesAutomatically = true;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticInlinePredictionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSDocumentSaveNewDocumentsToCloud = false;
      "com.apple.mouse.tapBehavior" = 1; # tap to click
    };
    WindowManager = {
      EnableStandardClickToShowDesktop = false;
    };
    dock = {
      autohide = true;
      show-recents = false;
      wvous-bl-corner = 1; # disable bottom left corner hot corner
      wvous-br-corner = 1;
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
    };
    trackpad = {
      ActuationStrength = 0;
      Clicking = true; # enable tap to click
    };
  };

  # brew settings
  homebrew = {
    enable = true;
    taps = [
      "sst/tap"
    ];
    brews = [
      "sst/tap/opencode"
      "openjdk"
      "k6"
      "artillery"
      "coreutils"
    ];
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
      "font-caskaydia-mono-nerd-font"
      "minecraft"
      "jordanbaird-ice"
    ];
    masApps = {
      "Reeder classic" = 1529445840;
    };
  };
}
