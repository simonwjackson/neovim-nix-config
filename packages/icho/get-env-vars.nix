{pkgs ? import <nixpkgs> {}}: let
  subfolder = ../../plugins;
  nixFiles =
    builtins.filter (fileName: builtins.match ".*\.nix" fileName != null)
    (builtins.attrNames (builtins.readDir subfolder));

  getEnvironmentValues = evaluatedFile: let
    attrs = evaluatedFile.environment or {};
    attrNames = builtins.attrNames attrs;
    pairs = builtins.map (name: "export ${name}=${attrs.${name}}") attrNames;
  in
    builtins.concatStringsSep "\n" pairs;

  evaluateFile = fileName:
    getEnvironmentValues (import (subfolder + "/${fileName}") {inherit pkgs;});

  fileEnvironmentValues = builtins.concatStringsSep "\n" (builtins.map evaluateFile nixFiles);
in
  fileEnvironmentValues
