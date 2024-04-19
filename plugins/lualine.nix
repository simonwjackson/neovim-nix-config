{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    tmux = pkgs.lib.getExe pkgs.tmux;
    hostname = pkgs.lib.getExe pkgs.hostname;
  };
}
