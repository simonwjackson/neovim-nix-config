inputs: {
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;

  cfg = config.programs.myNeovim;
  package = inputs.self.packages.${system}.default;

  neovimWrapper = pkgs.writeShellScriptBin "nvim" ''
    export ${lib.concatStringsSep " " (lib.mapAttrsToList (name: value: "${name}=${value}") cfg.environment)}
    ${lib.concatMapStringsSep "\n" (file: "source ${file}") cfg.environmentFiles}
    exec ${cfg.package}/bin/nvim "$@"
  '';
in {
  options.programs.myNeovim = {
    enable = lib.mkEnableOption "My custom Neovim configuration";

    package = lib.mkOption {
      type = lib.types.package;
      default = package;
      description = "The Neovim package to use.";
    };

    users = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      description = "List of users who should have the Neovim package added to their packages.";
    };

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
    environment.systemPackages = lib.mkIf (cfg.users == []) [
      neovimWrapper
    ];

    users.users = lib.genAttrs cfg.users (user: {
      packages = [
        neovimWrapper
      ];
    });
  };
}
