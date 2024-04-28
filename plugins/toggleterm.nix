{pkgs}: {
  packages = [
    pkgs.lf
  ];

  environment = {
  };

  replace = {
    toggleterm = pkgs.awesomeNeovimPlugins.toggleterm-nvim;
  };
}
