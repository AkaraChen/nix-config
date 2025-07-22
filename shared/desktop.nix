{ pkgs, dotfiles, ... }:

{
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER";
        decoration = {
          rounding = 10;
          blur.enabled = true;
          inactive_opacity = 0.75;
          active_opacity = 0.75;
        };
        "exec-once" = [
          "waybar"
          "ghostty"
          "hyprpaper"
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
        bind =
          [
            "$mod, F, exec, brave"
            "$mod, RETURN, exec, ghostty"
            "$mod, Q, killactive,"
            "$mod, D, exec, ulauncher"
          ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
            builtins.concatLists (builtins.genList (i:
                let ws = i + 1;
                in [
                  "$mod, code:1${toString i}, workspace, ${toString ws}"
                  "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                ]
              )
              9)
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
        ghostty
        ulauncher
        hyprpaper
    ];
    home.file = {
      "./.config/waybar".source = "${dotfiles}/.config/waybar";
      "./.config/assets".source = "${dotfiles}/.config/assets";
      "./.config/hypr/hyprpaper.conf".source = "${dotfiles}/.config/hypr/hyprpaper.conf";
    };
}
