{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.packages = with pkgs; [
    ripgrep
    fd
  ];

  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
    };
    defaultEditor = true;
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    plugins = {
      treesitter.enable = true;

      lsp = {
        enable = true;
        servers = {
          pyright.enable = true;
          nil_ls.enable = true;
        };
      };
      
      cmp = {
        enable = true;
	settings = {
	  mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
	    "<C-d>" = "cmp.mapping.scroll_docs(4)";
	    "<C-f>" = "cmp.mapping.scroll_docs(-4)";
	  };
	  sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
	  ];
	};
      };

      lsp-format.enable = true;

      telescope.enable = true;

      lualine.enable = true;
    };
  };
}
