{pkgs}: {
  environment = {
    USER = "simonwjackson";
    booser = "simonwjackson";
  };
  replace = {
    codeCompanion = pkgs.vimPlugins.code-companion;
  };
}
