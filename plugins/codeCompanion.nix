{pkgs}: {
  packages = [
  ];

  environment = {
  };
  replace = {
    codeCompanion = pkgs.vimPlugins.code-companion;
    nvimTreesitter = pkgs.vimPlugins.nvim-treesitter;
    treesitterYaml = (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.yaml])).dependencies;
  };
}
