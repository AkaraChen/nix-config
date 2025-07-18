rm /etc/nixos/configuration.nix
cp ./os/configuration.nix /etc/nixos/configuration.nix
nixos-rebuild switch
