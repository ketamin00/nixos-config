{ config, pkgs, ...}:
{

  home.packages = with pkgs; [
    neofetch
    wl-clipboard
    zip
    xc
    unzip
    p7zip
    ripgrep
    jq
    dnsutils
    file
    which
    tree
    bottom

  ];
  imports = [
    ./alacritty.nix
    ./direnv.nix
    ./lazygit.nix
    ./zsh.nix
    ./playerctl.nix
    ./git.nix
  ];

}
