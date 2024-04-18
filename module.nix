inputs: {
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;

  cfg = config.programs.myNeovim;
  package = inputs.self.packages.${system}.default;
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
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = lib.mkIf (cfg.users == []) [
      cfg.package
    ];

    users.users = lib.genAttrs cfg.users (user: {
      packages = [
        cfg.package
      ];
    });
  };
}
