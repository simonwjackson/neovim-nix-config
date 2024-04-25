{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    plenary = pkgs.awesomeNeovimPlugins.plenary-nvim;
  };
}
