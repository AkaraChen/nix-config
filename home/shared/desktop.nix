{
  pkgs,
  config,
  ...
}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      decoration = {
        rounding = 10;
        blur.enabled = true;
        inactive_opacity = 0.9;
        active_opacity = 0.9;
      };
      "exec-once" = [
        "waybar"
        "ghostty"
      ];
      "windowrulev2" = [
        "float, class:^(ulauncher)$"
        "center, class:^(ulauncher)$"
        "noborder, class:^(ulauncher)$"
        "noshadow, class:^(ulauncher)$"
        "rounding 0, class:^(ulauncher)$"
        "noblur, class:^(ulauncher)$"
        "opaque, class:^(ulauncher)$"
      ];
      bind = [
        "$mod, F, exec, brave"
        "$mod, RETURN, exec, ghostty"
        "$mod, Q, killactive,"
        "$mod, D, exec, ulauncher"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        )
      );
      binde = [
        "$mod, LEFT, resizeactive, -10 0"
        "$mod, RIGHT, resizeactive, 10 0"
        "$mod, UP, resizeactive, 0 -10"
        "$mod, DOWN, resizeactive, 0 10"
      ];
    };
  };
  home.packages = with pkgs; [
    ulauncher
    bibata-cursors
    swaybg
  ];
  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
  };
  home.sessionVariables = {
    HYPRCURSOR_THEME = "Bibata-Modern-Classic";
    HYPRCURSOR_SIZE = "24";
  };
  home.file = {
    "./.config/waybar".source = ../../dotfiles/.config/waybar;
    "./.config/assets".source = ../../dotfiles/.config/assets;
    "./.config/niri/config.kdl".source = ../../dotfiles/.config/niri/config.kdl;
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "${config.home.homeDirectory}/.config/assets/bochi-2.jpg";
      wallpaper = ",${config.home.homeDirectory}/.config/assets/bochi-2.jpg";
    };
  };
  programs.ghostty = {
    enable = true;
    settings = {
    };
  };
  systemd.user.services.swaybg = {
    Unit = {
      Description = "Sway Background";
      PartOf = "graphical-session.target";
    };
    Service = {
      ExecStart = "${pkgs.swaybg}/bin/swaybg -i ${config.home.homeDirectory}/.config/assets/bochi-1.jpg";
      Restart = "on-failure";
      RestartSec = "1";
      TimeoutStopSec = "5";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
