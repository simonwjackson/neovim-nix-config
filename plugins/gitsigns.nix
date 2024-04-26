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
    gitsigns = pkgs.awesomeNeovimPlugins.gitsigns-nvim;
    whichKey = pkgs.awesomeNeovimPlugins.which-key-nvim;
  };
}
