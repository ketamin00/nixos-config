{ inputs, outputs, colors, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs colors; };
    users = {
      julius = import ../../home;
    };
  };
}
