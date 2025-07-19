rm /etc/nixos/configuration.nix
cp ./os/configuration.nix /etc/nixos/configuration.nix
nixos-rebuild switch
nix run home-manager/master -- switch --flake .#linux
