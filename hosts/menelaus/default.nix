{ inputs, outputs, lib, config, pkgs, colors, ... }:

{
  imports =
    [
      ../components/hardware-configuration.nix
      ../components/nvidia.nix
      ../components/nix.nix
      ../components/bootloader.nix
      ../components/locales.nix
      ../components/networking.nix
      ../components/sound.nix
      ../components/users.nix
      ../components/wayland.nix
      ../components/greetd.nix
      ../components/docker.nix
      ../components/virtualbox.nix
      ../components/home-manager.nix
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
