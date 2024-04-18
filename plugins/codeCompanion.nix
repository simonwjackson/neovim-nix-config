{pkgs}: {
  packages = [
    pkgs.cowsay
    pkgs.lf
  ];

  environment = {
  };
  replace = {
    codeCompanion = pkgs.vimPlugins.code-companion;
  };
}
