{ config, pkgs, ... }:

{
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  networking.networkmanager.enable = true;
  networking.hostName = "julius-nixos";

  services.resolved = {
    enable = true;
#    dnssec = "allow-downgrade";
#    domains = [ "~." ];
#    fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
#    extraConfig = ''
#      DNSOverTLS=yes
#    '';
  };
}
