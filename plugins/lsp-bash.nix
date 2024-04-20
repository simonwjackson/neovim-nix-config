{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    bashLanguageServer = pkgs.lib.getExe pkgs.nodePackages_latest.bash-language-server;
  };
}
