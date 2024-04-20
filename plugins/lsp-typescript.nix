{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    typescriptLanguageServer = pkgs.lib.getExe pkgs.nodePackages_latest.typescript-language-server;
  };
}
