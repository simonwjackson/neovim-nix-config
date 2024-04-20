{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    htmxLsp = pkgs.lib.getExe pkgs.htmx-lsp;
  };
}
