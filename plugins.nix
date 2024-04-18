{
  pkgs ? import <nixpkgs> {},
  pluginDir ? ./plugins,
}: let
  pluginFiles = builtins.readDir pluginDir;
  luaFiles =
    builtins.filter (fileName: pkgs.lib.hasSuffix ".lua" fileName)
    (builtins.attrNames pluginFiles);

  buildPlugin = luaFile: let
    name = pkgs.lib.removeSuffix ".lua" luaFile;
    pluginNixFile = pluginDir + "/${name}.nix";
    deps =
      if builtins.pathExists pluginNixFile
      then import pluginNixFile {inherit pkgs;}
      else {replace = {};};
    substitutions =
      pkgs.lib.mapAttrs'
      (name: value: pkgs.lib.nameValuePair name value)
      deps.replace;
  in
    pkgs.substituteAll (substitutions
      // {
        src = pluginDir + "/${luaFile}";
        dir = "plugins";
        name = luaFile;
      });

  plugins = builtins.listToAttrs (map
    (luaFile:
      pkgs.lib.nameValuePair
      (pkgs.lib.removeSuffix ".lua" luaFile)
      (buildPlugin luaFile))
    luaFiles);
in
  pkgs.symlinkJoin {
    name = "converted-plugins";
    paths = builtins.attrValues plugins;
  }
