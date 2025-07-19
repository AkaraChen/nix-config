sudo nixos-rebuild switch --flake .#nixos
nix run home-manager/master -- switch --flake .#linux
