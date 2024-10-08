{
  hostname,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  time.timeZone = "Europe/Copenhagen";

  networking.hostName = "${hostname}";

  programs.zsh.enable = true;

  users.users.julius = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "docker"
    ];
    hashedPassword = "$6$NFybOOj2fgSavlzj$mfDprTefkFxZYS4yjxgw0QNh0cU3S0QaUhURGucVwfJ7tydVgVC9cvb9CH0kN0zxu98H4g2dm4Xg3hVDrH5pD1";
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users.julius = import ./home.nix;
  };

  system.stateVersion = "24.05";

  wsl = {
    enable = true;
    defaultUser = "julius";
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };

  nix = {
    settings = {
      trusted-users = ["julius"];

      accept-flake-config = true;
      auto-optimise-store = true;
    };

    registry = {
      nixpkgs = {
        flake = inputs.nixpkgs;
      };
    };

    nixPath = [
      "nixpkgs=${inputs.nixpkgs.outPath}"
      "nixos-config=/etc/nixos/configuration.nix"
      "/nix/var/nix/profiles/per-user/root/channels"
    ];

    package = pkgs.nixFlakes;
    extraOptions = ''experimental-features = nix-command flakes'';

    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

    image = /mnt/c/Users/juliu/OneDrive/Billeder/Wallpapers/gruvbox_image31.png;

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
