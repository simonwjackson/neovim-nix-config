{pkgs}: {
  packages = [
    pkgs.nodePackages_latest.bash-language-server
    pkgs.lua-language-server
    pkgs.nodePackages_latest.typescript-language-server
    pkgs.yaml-language-server
    pkgs.jq-lsp
    pkgs.vscode-langservers-extracted
    pkgs.htmx-lsp
    pkgs.nixd
    pkgs.elmPackages.elm-language-server
    pkgs.tailwindcss-language-server
  ];

  environment = {
  };

  environmentFiles = [
  ];

  extraPackages = [
  ];

  replace = {
    lspConfig = pkgs.awesomeNeovimPlugins.nvim-lspconfig;
  };
}
