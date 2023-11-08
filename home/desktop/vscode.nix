{ config, pkgs, unstable, ... }:
{
  home.packages = with pkgs; [
    nixpkgs-fmt
  ];
  programs.vscode = {
    enable = true;
    userSettings = {
      "window.titleBarStyle" = "custom";
    };
    mutableExtensionsDir = true;
    extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
      mkhl.direnv
      ms-vscode.cpptools
      vscodevim.vim
      jnoortheen.nix-ide
    ];
  };
}
