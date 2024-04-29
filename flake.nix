{
  description = "My own Neovim flake with plugins";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    # neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    flake-utils.url = "github:numtide/flake-utils";

    # Neovim plugins

    awesome-neovim-plugins.url = "github:m15a/flake-awesome-neovim-plugins";
    tree-sitter-just = {
      url = "github:IndianBoy42/tree-sitter-just";
      flake = false;
    };

    middleclass = {
      url = "github:anuvyklack/middleclass";
      flake = false;
    };

    vim-visual-star-search = {
      url = "github:nelstrom/vim-visual-star-search";
      flake = false;
    };

    edgy-nvim = {
      url = "github:folke/edgy.nvim";
      flake = false;
    };

    cmp_luasnip = {
      url = "github:saadparwaiz1/cmp_luasnip";
      flake = false;
    };

    cmp-nvim-lsp = {
      url = "github:hrsh7th/cmp-nvim-lsp";
      flake = false;
    };

    cmp-nvim-lua = {
      url = "github:hrsh7th/cmp-nvim-lua";
      flake = false;
    };

    cmp-buffer = {
      url = "github:hrsh7th/cmp-buffer";
      flake = false;
    };

    cmp-path = {
      url = "github:hrsh7th/cmp-path";
      flake = false;
    };

    cmp-cmdline = {
      url = "github:hrsh7th/cmp-cmdline";
      flake = false;
    };

    cmp-nvim-lsp-signature-help = {
      url = "github:hrsh7th/cmp-nvim-lsp-signature-help";
      flake = false;
    };

    cmp-treesitter = {
      url = "github:ray-x/cmp-treesitter";
      flake = false;
    };

    cmp-spell = {
      url = "github:f3fora/cmp-spell";
      flake = false;
    };

    cmp-emoji = {
      url = "github:hrsh7th/cmp-emoji";
      flake = false;
    };

    cmp-calc = {
      url = "github:hrsh7th/cmp-calc";
      flake = false;
    };

    cmp-npm = {
      url = "github:David-Kunz/cmp-npm";
      flake = false;
    };

    git-worktree-nvim = {
      url = "github:ThePrimeagen/git-worktree.nvim";
      flake = false;
    };

    nvim-osc52 = {
      url = "github:ojroques/nvim-osc52";
      flake = false;
    };

    ripgrep = {
      url = "github:BurntSushi/ripgrep";
      flake = false;
    };

    fd = {
      url = "github:sharkdp/fd";
      flake = false;
    };

    vim-dadbod-ui = {
      url = "github:kristijanhusak/vim-dadbod-ui";
      flake = false;
    };

    vim-dadbod = {
      url = "github:tpope/vim-dadbod";
      flake = false;
    };

    vim-highlightedyank = {
      url = "github:machakann/vim-highlightedyank";
      flake = false;
    };

    lspkind-nvim = {
      url = "github:onsails/lspkind.nvim";
      flake = false;
    };

    vim-dadbod-completion = {
      url = "github:kristijanhusak/vim-dadbod-completion";
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
            inputs.awesome-neovim-plugins.overlays.default
            # inputs.neovim-nightly-overlay.overlay
            (final: prev: {
              vimPlugins =
                prev.vimPlugins
                // {
                  tree-sitter-just = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.tree-sitter-just;
                    src = inputs.tree-sitter-just;
                  };

                  vim-dadbod-ui = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.vim-dadbod-ui;
                    src = inputs.vim-dadbod-ui;
                  };

                  vim-dadbod = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.vim-dadbod;
                    src = inputs.vim-dadbod;
                  };

                  middleclass = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.middleclass;
                    src = inputs.middleclass;
                  };

                  vim-visual-star-search = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.vim-visual-star-search;
                    src = inputs.vim-visual-star-search;
                  };

                  vim-expand-region = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.vim-expand-region;
                    src = inputs.vim-expand-region;
                  };

                  cmp_luasnip = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.cmp_luasnip;
                    src = inputs.cmp_luasnip;
                  };

                  cmp-nvim-lsp = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.cmp-nvim-lsp;
                    src = inputs.cmp-nvim-lsp;
                  };

                  cmp-nvim-lua = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.cmp-nvim-lua;
                    src = inputs.cmp-nvim-lua;
                  };

                  cmp-buffer = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.cmp-buffer;
                    src = inputs.cmp-buffer;
                  };

                  cmp-path = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.cmp-path;
                    src = inputs.cmp-path;
                  };

                  cmp-cmdline = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.cmp-cmdline;
                    src = inputs.cmp-cmdline;
                  };

                  cmp-nvim-lsp-signature-help = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.cmp-nvim-lsp-signature-help;
                    src = inputs.cmp-nvim-lsp-signature-help;
                  };

                  cmp-treesitter = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.cmp-treesitter;
                    src = inputs.cmp-treesitter;
                  };

                  cmp-spell = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.cmp-spell;
                    src = inputs.cmp-spell;
                  };

                  cmp-emoji = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.cmp-emoji;
                    src = inputs.cmp-emoji;
                  };

                  cmp-calc = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.cmp-calc;
                    src = inputs.cmp-calc;
                  };

                  cmp-npm = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.cmp-npm;
                    src = inputs.cmp-npm;
                  };

                  vim-dadbod-completion = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.vim-dadbod-completion;
                    src = inputs.vim-dadbod-completion;
                  };

                  fd = prev.buildPackages.fd;

                  ripgrep = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.ripgrep;
                    src = inputs.ripgrep;
                  };

                  vim-highlightedyank = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.vim-highlightedyank;
                    src = inputs.vim-highlightedyank;
                  };

                  ###

                  lspkind-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.lspkind-nvim;
                    src = inputs.lspkind-nvim;
                  };

                  git-worktree-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.git-worktree-nvim;
                    src = inputs.git-worktree-nvim;
                  };

                  nvim-osc52 = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.nvim-osc52;
                    src = inputs.nvim-osc52;
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
