{
  description = "Ketamin00 Nix Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
    	url = "github:nix-community/NixOS-WSL/main";
      	inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
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

    makeNixosConfig = hostname:
      nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs hostname;
        };
        modules = [
          inputs.stylix.nixosModules.stylix
          ./system
          ./hosts/${hostname}
        ];
      };
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations = {
      ares = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
          hostname = "ares";
        };
        modules = [
          inputs.stylix.nixosModules.stylix
          ./system
          ./hosts/ares
        ];
      };
      zeus = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
          hostname = "zeus";
        };
        modules = [
          inputs.stylix.nixosModules.stylix
          ./system
          ./hosts/zeus
        ];
      };

      hermes = nixpkgs.lib.nixosSystem {
      	system = "x86_64-linux";
        specialArgs = {
          inherit inputs outputs;
          hostname = "hermes";
        };
        modules = [
          inputs.stylix.nixosModules.stylix
	  inputs.nixos-wsl.nixosModules.default
	  inputs.home-manager.nixosModules.home-manager

          ./hosts/hermes
        ];
      };
    };
  };
}
