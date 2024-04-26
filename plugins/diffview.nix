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
    diffView = pkgs.awesomeNeovimPlugins.diffview-nvim;
    plenary = pkgs.awesomeNeovimPlugins.plenary-nvim;
  };
}
