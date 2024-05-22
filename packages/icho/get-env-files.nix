{pkgs ? import <nixpkgs> {}}: let
  subfolder = ../../plugins;
  nixFiles =
    builtins.filter (fileName: builtins.match ".*\.nix" fileName != null)
    (builtins.attrNames (builtins.readDir subfolder));

  evaluateFile = fileName: let
    filePath = subfolder + "/${fileName}";
    evaluatedFile = import filePath {inherit pkgs;};
  in
    if builtins.hasAttr "environmentFiles" evaluatedFile
    then builtins.concatStringsSep "\n" (builtins.map (path: "export $(<${path})") evaluatedFile.environmentFiles)
    else "";

  exportEnvironmentFiles = builtins.concatStringsSep "\n" (builtins.filter (v: v != "") (builtins.map evaluateFile nixFiles));
in
  exportEnvironmentFiles
