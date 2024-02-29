{
  description = "Ketamin NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astronvim = {
      url = "github:AstroNvim/AstroNvim";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    astronvim,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
    colors = import ./colors.nix;
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
    overlays = import ./overlays {inherit inputs;};
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    # Acessible through 'nix develop' or 'nix-shell' (legacy)
    #devShells = forAllSystems (system:
    #  let pkgs = nixpkgs.legacyPackages.${system};
    #  in import ./shell.nix { inherit pkgs; }
    #);

    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      menelaus = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs colors;};
        modules = [
          ./hosts/menelaus
        ];
      };
    };
  };
}
