sudo rm /etc/nixos/configuration.nix
sudo cp ./os/configuration.nix /etc/nixos/configuration.nix
sudo nixos-rebuild switch
nix run home-manager/master -- switch --flake .#linux
