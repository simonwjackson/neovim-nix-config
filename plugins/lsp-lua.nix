{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    luaLanguageServer = pkgs.lib.getExe pkgs.lua-language-server;
  };
}
