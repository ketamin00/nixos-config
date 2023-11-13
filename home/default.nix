{ inputs, outputs, lib, config, pkgs, ... }:
{
  home.stateVersion = "23.05";
  home.username = "julius";
  home.homeDirectory = "/home/julius";
  programs.home-manager.enable = true;

  imports = [
    ./desktop
    ./shell
  ];

  systemd.user.startServices = "sd-switch";
  
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}
