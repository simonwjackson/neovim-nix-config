{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    nvimContextVt = pkgs.awesomeNeovimPlugins.nvim-context-vt;
  };
}
