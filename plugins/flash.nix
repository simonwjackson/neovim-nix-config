{pkgs}: {
  packages = [
  ];

  environment = {
  };

  environmentFiles = [
  ];

  extraPackages = [
    pkgs.cowsay
  ];

  replace = {
    flash = pkgs.vimPlugins.flash;
  };
}
