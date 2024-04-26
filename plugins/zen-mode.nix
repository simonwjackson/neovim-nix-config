{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    zenMode = pkgs.awesomeNeovimPlugins.zen-mode-nvim;
  };
}
