{ pkgs, dotfiles, ... }:

{
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER";
        "exec-once"= [
          "waybar"
          "ghostty"
        ];
        bind =
          [
            "$mod, F, exec, firefox"
            "$mod, RETURN, exec, ghostty"
            "$mod, Q, killactive,"
            "$mod, D, exec, wofi --show drun"
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
      };
    };
    home.packages = with pkgs; [
        nerd-fonts.zed-mono
        ghostty
        wofi
    ];
}
