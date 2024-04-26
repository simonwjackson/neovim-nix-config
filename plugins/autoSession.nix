{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    autoSession = pkgs.awesomeNeovimPlugins.auto-session;
  };
}
