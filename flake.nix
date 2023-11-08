{
  description = "KETAMIN NixOS Flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      unstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
      colors = import ./colors.nix;
    in
    {
      nixosConfigurations = {
        "adonis" = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/adonis
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.julius = import ./home;
              home-manager.extraSpecialArgs = { inherit unstable colors; };
            }
          ];
        };
      };
    };
}
