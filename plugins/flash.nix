{pkgs}: {
  environment = {
    snoozer = "simonwjackson";
    cruizernh = "simonwjackson";
  };

  environmentFiles = [
    "/a/b/c"
    "/d/e"
  ];

  replace = {
    flash = pkgs.vimPlugins.flash;
  };
}
