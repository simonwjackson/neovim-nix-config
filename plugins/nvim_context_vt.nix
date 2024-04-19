{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    nvimTreesitter = pkgs.vimPlugins.nvim-treesitter;
  };
}
