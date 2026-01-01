# nix-darwin-config

Minimal declarative configuration for:
- NixOS desktop (fully declarative)
- macOS laptop (nix-darwin + home-manager)

## Rebuild

### NixOS
```bash
sudo nixos-rebuild switch --flake .#desktop

