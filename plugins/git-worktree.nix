{pkgs}: {
  packages = [
  ];

  environment = {
  };

  environmentFiles = [
  ];

  extraPackages = [
    pkgs.cowsay
  ];

  replace = {
    gitWorktreeNvim = pkgs.vimPlugins.git-worktree-nvim;
    whichKeyNvim = pkgs.vimPlugins.which-key-nvim;
    plenaryNvim = pkgs.vimPlugins.plenary-nvim;
    telescope = pkgs.vimPlugins.telescope-nvim;
  };
}
