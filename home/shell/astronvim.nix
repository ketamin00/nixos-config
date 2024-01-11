{inputs, pkgs, ...}: {
  xdg.configFile = {
    nvim = {
      onChange = "${pkgs.neovim}/bin/nvim --headless +q";
      source = inputs.astronvim;
    };
  };
}
