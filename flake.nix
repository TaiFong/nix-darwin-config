{
  description = "Minimal declarative NixOS + macOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, darwin, ... }:
  let
    username = "iat";
    systems = {
      nixos = "x86_64-linux";
      darwin = "aarch64-darwin";
    };
  in
  {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = systems.nixos;
      modules = [
        ./hosts/nixos/desktop.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = import ./modules/shared.nix;
        }
      ];
    };

    darwinConfigurations.laptop = darwin.lib.darwinSystem {
      system = systems.darwin;
      modules = [
        ./hosts/darwin/laptop.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = import ./modules/shared.nix;
        }
      ];
    };
  };
}

