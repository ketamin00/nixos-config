# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
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
