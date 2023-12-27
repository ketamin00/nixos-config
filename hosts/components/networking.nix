{ config, pkgs, ... }:

{
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  networking.networkmanager.enable = true;
  networking.hostName = "julius-nixos";
}
