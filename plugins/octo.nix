{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    octo = pkgs.awesomeNeovimPlugins.octo-nvim;
    plenary = pkgs.awesomeNeovimPlugins.plenary-nvim;
    telescope = pkgs.awesomeNeovimPlugins.telescope-nvim;
    nvimWebDevicons = pkgs.awesomeNeovimPlugins.nvim-web-devicons;
  };
}
