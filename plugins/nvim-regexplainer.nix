{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    # TODO: Place this in `runtimepath`
    # (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.regex])).dependencies
  };
}
