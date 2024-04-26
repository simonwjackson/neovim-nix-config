{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    sort = pkgs.awesomeNeovimPlugins.sort-nvim;
  };
}
