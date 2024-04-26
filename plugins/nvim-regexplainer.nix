{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    regexplainer = pkgs.awesomeNeovimPlugins.nvim-regexplainer;
    nui = pkgs.awesomeNeovimPlugins.nui-nvim;
    # TODO: Place this in `runtimepath`
    # (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.regex])).dependencies
  };
}
