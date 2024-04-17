{
  description = "My own Neovim flake with plugins";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };

    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lazy-nvim = {
      url = "github:folke/lazy.nvim";
      flake = false;
    };

    which-key = {
      url = "github:folke/which-key.nvim";
      flake = false;
    };

    flash = {
      url = "github:folke/flash.nvim";
      flake = false;
    };

    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    neovim,
    flake-utils,
    lazy-nvim,
    which-key,
    flash,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (final: prev: {
              vimPlugins =
                prev.vimPlugins
                // {
                  lazy-nvim = prev.vimUtils.buildVimPluginFrom2Nix {
                    pname = "lazy-nvim";
                    version = "latest";
                    src = lazy-nvim;
                  };
                  flash = prev.vimUtils.buildVimPluginFrom2Nix {
                    pname = "flash";
                    version = "latest";
                    src = flash;
                  };
                  which-key = prev.vimUtils.buildVimPluginFrom2Nix {
                    pname = "which-key";
                    version = "latest";
                    src = which-key;
                  };
                };
            })
          ];
        };

        plugins = pkgs.callPackage ./plugins.nix {};

        neovimConfig = pkgs.runCommandNoCC "neovimConfig" {} ''
          mkdir -p $out/nvim/lua
          cp -r ${self}/config/* $out/nvim/
          ln -s ${plugins}/* $out/nvim/lua
        '';

        neovimWrapped = pkgs.writeShellScriptBin "nvim" ''
          export XDG_CONFIG_HOME="${neovimConfig}"

          ${neovim.packages.${system}.neovim}/bin/nvim "$@"
        '';
      in {
        packages.default = neovimWrapped;
        apps.default = {
          type = "app";
          program = "${neovimWrapped}/bin/nvim";
        };
      }
    );
}
