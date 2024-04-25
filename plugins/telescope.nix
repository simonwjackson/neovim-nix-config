{pkgs}: {
  packages = [
    pkgs.ripgrep
  ];
  replace = {
    nvimTreesitter = pkgs.vimPlugins.nvim-treesitter;
  };
}
##
