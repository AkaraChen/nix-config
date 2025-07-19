# nix config

## home manager

```bash
# linux arm
NIX_CONFIG="experimental-features = nix-command flakes" nix run home-manager/master -- switch --flake .#linux

# linux x86_64 (wsl)
NIX_CONFIG="experimental-features = nix-command flakes" nix run home-manager/master -- switch --flake .#x86_64-linux

# linux gui
NIX_CONFIG="experimental-features = nix-command flakes" nix run home-manager/master -- switch --flake .#linux-gui

# macos
NIX_CONFIG="experimental-features = nix-command flakes" nix run home-manager/master -- switch --flake .#darwin
```

## nix darwin

```bash
sudo NIX_CONFIG="experimental-features = nix-command flakes" nix run nix-darwin/nix-darwin-25.05#darwin-rebuild -- switch --flake .
```

## nixos

```bash
sudo nixos-rebuild switch --flake .#nixos --impure
```
