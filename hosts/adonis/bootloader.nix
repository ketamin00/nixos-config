{ config, pkgs, ... }:

{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 10;
    };
    timeout = null;
  };
  boot.kernelParams = [ "quiet" ];
}
