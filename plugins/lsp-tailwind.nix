{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    tailwindLanguageServer = pkgs.lib.getExe pkgs.tailwindcss-language-server;
  };
}
