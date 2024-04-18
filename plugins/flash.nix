{pkgs}: {
  packages = [
    pkgs.cowsay
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
