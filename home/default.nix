{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
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
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/http" = ["firefox.desktop"];
	"x-scheme-handler/https" = "firefox.desktop";
      };
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
