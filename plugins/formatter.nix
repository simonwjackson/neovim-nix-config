{pkgs}: {
  packages = [
    pkgs.alejandra
    pkgs.shfmt
    pkgs.stylua
    pkgs.eslint_d
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
    formatterNvim = pkgs.vimPlugins.formatter-nvim;
  };
}
