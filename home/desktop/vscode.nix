{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nixpkgs-fmt
  ];
  programs.vscode = {
    enable = true;
    userSettings = {
      "window.titleBarStyle" = "custom";
      "workbench.colorTheme" = "Gruvbox Dark Hard";
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
    };
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
      mkhl.direnv
      ms-vscode.cpptools
      vscodevim.vim
      jnoortheen.nix-ide
      ms-python.python
    ];
  };
}
