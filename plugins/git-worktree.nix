{pkgs}: {
  packages = [
  ];

  environment = {
  };

  environmentFiles = [
  ];

  extraPackages = [
  ];

  replace = {
    gitWorktreeNvim = pkgs.vimPlugins.git-worktree-nvim;
    whichKeyNvim = pkgs.awesomeNeovimPlugins.which-key-nvim;
    plenaryNvim = pkgs.awesomeNeovimPlugins.plenary-nvim;
    telescope = pkgs.awesomeNeovimPlugins.telescope-nvim;
  };
}
