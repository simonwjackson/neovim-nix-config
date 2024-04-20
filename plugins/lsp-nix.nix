{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    nixd = pkgs.lib.getExe pkgs.nixd;
  };
}
