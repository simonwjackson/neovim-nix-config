{pkgs}: {
  packages = [
    pkgs.alejandra
    pkgs.prettierd
    pkgs.stylua
    pkgs.eslint_d
    pkgs.nodejs
    pkgs.gawk
    pkgs.jq
    pkgs.just
    pkgs.yq-go
    pkgs.shfmt
    pkgs.elmPackages.elm-format
  ];

  environment = {
  };

  environmentFiles = [
  ];

  extraPackages = [
    pkgs.cowsay
  ];

  replace = {
    conform = pkgs.awesomeNeovimPlugins.conform-nvim;
  };
}
