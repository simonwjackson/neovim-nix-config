{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;

  pname = "icho";
  cfg = config.programs.icho;
  package = inputs.self.packages.${system}.default;

  neovimWrapped = pkgs.writeShellScriptBin "nvim" ''
    export ${lib.concatStringsSep " " (lib.mapAttrsToList (name: value: "${name}=${value}") cfg.environment)}
    ${lib.concatMapStringsSep "\n" (file: "source ${file}") cfg.environmentFiles}
    exec ${package}/bin/nvim "$@"
  '';
in {
  options.programs.icho = {
    enable = lib.mkEnableOption "My custom Neovim configuration";

    # package = lib.mkOption {
    #   type = lib.types.package;
    #   default = package;
    #   description = "The Neovim package to use.";
    # };

    environment = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {};
      description = "Environment variables to set for Neovim.";
    };

    environmentFiles = lib.mkOption {
      type = lib.types.listOf lib.types.path;
      default = [];
      description = "List of files containing environment variables to set for Neovim.";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      neovimWrapped
    ];
  };
}
