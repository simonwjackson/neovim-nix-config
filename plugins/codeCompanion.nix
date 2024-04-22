{pkgs}: {
  packages = [
  ];

  environment = {
  };
  replace = {
    codeCompanion = pkgs.vimPlugins.code-companion;
    nvimTreesitter = pkgs.vimPlugins.nvim-treesitter;
    plenaryNvim = pkgs.vimPlugins.plenary-nvim;
    dressing = pkgs.vimPlugins.dressing-nvim;
    telescope = pkgs.vimPlugins.telescope-nvim;
    edgyNvim = pkgs.vimPlugins.edgy-nvim;
    treesitterYaml = (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.yaml])).dependencies;
  };
}
