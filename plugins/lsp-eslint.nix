{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    eslintls = "${pkgs.nodePackages.vscode-langservers-extracted}/bin/vscode-eslint-language-server";
  };
}
