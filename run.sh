NIX_CONFIG="experimental-features = nix-command flakes" nix run home-manager/master -- switch --flake .#linux
