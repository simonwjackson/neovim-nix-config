{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    noice = pkgs.awesomeNeovimPlugins.noice-nvim;
    nui = pkgs.awesomeNeovimPlugins.nui-nvim;
  };
}
