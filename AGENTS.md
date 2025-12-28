# Repository Guidelines

## Project Structure & Modules
- `flake.nix`: Flake inputs/outputs for NixOS, nix-darwin, and Home Manager.
- `home/`: Home Manager modules. Use `home/shared/*.nix` for cross‑platform bits; platform files like `home/home.nix` (Linux) and `home/home-mac.nix` (macOS). Dotfiles mapped via `home.file`.
- `os/`: System modules. `os/darwin.nix` (nix-darwin), `os/configuration.nix` (NixOS), and `os/shared.nix` (common).
- `dotfiles/`: Versioned config assets referenced by Home Manager.
- `apply.sh`: Menu script to apply the right target on macOS/Linux.

## Build, Test, and Development
- Apply interactively: `chmod +x ./apply.sh && ./apply.sh`.
- Validate flake: `nix flake check` (evals and runs checks).
- Dry-run builds (no switch):
  - Home Manager: `nix run home-manager/master -- build --flake .#darwin`
  - nix-darwin: `nix run nix-darwin/nix-darwin-25.11#darwin-rebuild -- build --flake .`
  - NixOS: `sudo nixos-rebuild build --flake .#nixos --impure`
- Update inputs: `nix flake update` (or `nix flake lock --update-input <name>`).

## Coding Style & Naming
- Nix: 2-space indent, one attribute per line, consistent semicolons; keep modules small and composable.
- Format before committing: `nix fmt` (or `alejandra`/`nixpkgs-fmt` if preferred).
- Names: lowercase-kebab for files (e.g., `desktop.nix`), descriptive attribute names (e.g., `homeConfigurations.linux-gui`).

## Testing Guidelines
- Ensure `nix flake check` passes and platform builds succeed.
- Prefer `build` over `switch` while reviewing. Example: `nix build .#homeConfigurations.darwin.activationPackage`.
- For `home.file`, reference paths under `dotfiles/` and verify with `nix eval .#homeConfigurations.darwin.activationPackage.drvPath`.

## Commit & Pull Requests
- Commits: concise, present tense. Suggested: `type(scope): summary` (e.g., `feat(os): add Hyprland keybinds`).
- PRs: describe platforms touched (Linux GUI, NixOS, macOS), list validation commands run, and include screenshots for UI tweaks (e.g., Waybar).

## Security & Configuration Tips
- Don’t commit secrets; keep machine-specific values in modules, not `dotfiles/`.
- Add packages in the appropriate layer: system packages in `os/*`, user tools in `home/shared/*.nix`.
- macOS GUI/apps via `homebrew` in `os/darwin.nix`; prefer Home Manager for user-level CLI tools.
