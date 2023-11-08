{ config, pkgs, unstable, ... }:
{
  home.packages = with pkgs; [
    nixpkgs-fmt
  ];
  programs.vscode = {
    enable = true;
    userSettings = {
      "window.titleBarStyle" = "custom";
      "workbench.colorTheme" = "Gruvbox Dark Hard";
    };
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
      mkhl.direnv
      ms-vscode.cpptools
      vscodevim.vim
      jnoortheen.nix-ide
      ChaitanyaShahare.lazygit
    ];
  };
}
