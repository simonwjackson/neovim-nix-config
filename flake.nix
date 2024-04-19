{
  description = "My own Neovim flake with plugins";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    lazy-nvim = {
      url = "github:folke/lazy.nvim";
      flake = false;
    };

    # (Neo)vim Plugins
    treesitter = {
      url = "github:nvim-treesitter/nvim-treesitter";
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

    code-companion = {
      url = "github:olimorris/codecompanion.nvim";
      flake = false;
    };
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
    {
      nixosModules.default = import ./module.nix inputs;
    }
    // flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (final: prev: {
              vimPlugins =
                prev.vimPlugins
                // {
                  lazy-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.lazy-nvim;
                    src = inputs.lazy-nvim;
                  };
                  treesitter = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.treesitter;
                    src = inputs.treesitter;
                  };
                  flash = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.flash;
                    src = inputs.flash;
                  };
                  which-key = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.which-key;
                    src = inputs.which-key;
                  };
                  code-companion = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.code-companion;
                    src = inputs.code-companion;
                  };
                };
            })
          ];
        };

        neovimWrapped = pkgs.callPackage ./neovimWrapped.nix {
          inherit pkgs self;
        };
      in {
        checks = {
          system-wide = pkgs.callPackage ./nixosModuleTest-system-wide.nix {
            inherit pkgs self;
          };
          single-user = pkgs.callPackage ./nixosModuleTest-single-user.nix {
            inherit pkgs self;
          };
        };
        packages.default = neovimWrapped;
      }
    );
}
