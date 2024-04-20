{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    yamlLanguageServer = pkgs.lib.getExe pkgs.yaml-language-server;
  };
}
