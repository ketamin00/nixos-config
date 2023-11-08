{ config, pkgs, unstable, ... }:
{
  programs.vscode = {
    enable = true;
    userSettings = {
      "window.titleBarStyle" = "custom";
    };
    #package = unstable.vscode;
    extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
      mkhl.direnv
      ms-vscode.cpptools
      vscodevim.vim
    ];
  };
}
