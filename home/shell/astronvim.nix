{inputs, pkgs, ...}: {

  home.packages = with pkgs; [
    gcc
    nodejs
  ];

  xdg.configFile = {
    nvim = {
      onChange = "${pkgs.neovim}/bin/nvim --headless +q";
      source = inputs.astronvim;
    };
  };
}
