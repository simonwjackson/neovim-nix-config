{pkgs ? import <nixpkgs> {}}: let
  subfolder = ./plugins;
  nixFiles =
    builtins.filter (fileName: builtins.match ".*\.nix" fileName != null)
    (builtins.attrNames (builtins.readDir subfolder));

  packages = fileName: let
    filePath = subfolder + "/${fileName}";
    evaluatedFile = import filePath {inherit pkgs;};
  in
    if builtins.hasAttr "packages" evaluatedFile
    then evaluatedFile.packages
    else [];

  allPackages = builtins.concatLists (builtins.map packages nixFiles);
in
  allPackages
