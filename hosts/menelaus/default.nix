{ inputs, outputs, lib, config, pkgs, colors, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./nvidia.nix
      ./nix.nix
      ./bootloader.nix
      ./locales.nix
      ./networking.nix
      ./sound.nix
      ./users.nix
      ./wayland.nix
      ./greetd.nix
      ./docker.nix
      ./virtualbox.nix
      ./home-manager.nix
    ];

  environment.systemPackages = with pkgs; [
    neovim
    git
    wget
    curl
  ];
  services.gvfs.enable = true;

  system.stateVersion = "23.05"; # Did you read the comment?

}
