sudo nixos-rebuild switch --flake .#nixos --impure
nix run home-manager/master -- switch --flake .#nixos
