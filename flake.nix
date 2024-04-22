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

    rose-pine = {
      url = "github:rose-pine/neovim";
      flake = false;
    };
    vim-floaterm = {
      url = "github:voldikss/vim-floaterm";
      flake = false;
    };
    vim-eunuch = {
      url = "github:tpope/vim-eunuch";
      flake = false;
    };
    vim-visual-star-search = {
      url = "github:nelstrom/vim-visual-star-search";
      flake = false;
    };
    vim-expand-region = {
      url = "github:terryma/vim-expand-region";
      flake = false;
    };
    is-vim = {
      url = "github:haya14busa/is.vim";
      flake = false;
    };
    neoconf-nvim = {
      url = "github:folke/neoconf.nvim";
      flake = false;
    };
    neodev-nvim = {
      url = "github:folke/neodev.nvim";
      flake = false;
    };
    mason-lspconfig-nvim = {
      url = "github:williamboman/mason-lspconfig.nvim";
      flake = false;
    };
    nvim-lspconfig = {
      url = "github:neovim/nvim-lspconfig";
      flake = false;
    };
    lsp_signature-nvim = {
      url = "github:ray-x/lsp_signature.nvim";
      flake = false;
    };
    vim-mdx-js = {
      url = "github:jxnblk/vim-mdx-js";
      flake = false;
    };
    nvim-surround = {
      url = "github:kylechui/nvim-surround";
      flake = false;
    };
    auto-session = {
      url = "github:rmagatti/auto-session";
      flake = false;
    };
    edgy-nvim = {
      url = "github:folke/edgy.nvim";
      flake = false;
    };
    plenary-nvim = {
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };
    telescope-nvim = {
      url = "https://github.com/nvim-telescope/telescope.nvim/archive/refs/tags/0.1.6.tar.gz";
      flake = false;
    };
    dressing-nvim = {
      url = "github:stevearc/dressing.nvim";
      flake = false;
    };
    comment-nvim = {
      url = "github:numToStr/Comment.nvim";
      flake = false;
    };
    diffview-nvim = {
      url = "github:sindrets/diffview.nvim";
      flake = false;
    };
    focus-nvim = {
      url = "github:beauwilliams/focus.nvim";
      flake = false;
    };
    formatter-nvim = {
      url = "github:mhartington/formatter.nvim";
      flake = false;
    };
    git-worktree-nvim = {
      url = "github:ThePrimeagen/git-worktree.nvim";
      flake = false;
    };
    which-key-nvim = {
      url = "github:folke/which-key.nvim";
      flake = false;
    };
    gitsigns-nvim = {
      url = "github:lewis6991/gitsigns.nvim";
      flake = false;
    };
    lualine-nvim = {
      url = "github:nvim-lualine/lualine.nvim";
      flake = false;
    };
    nui-nvim = {
      url = "github:MunifTanjim/nui.nvim";
      flake = false;
    };
    noice-nvim = {
      url = "github:folke/noice.nvim";
      flake = false;
    };
    nvim-lint = {
      url = "github:mfussenegger/nvim-lint";
      flake = false;
    };
    nvim-osc52 = {
      url = "github:ojroques/nvim-osc52";
      flake = false;
    };
    nvim-ts-autotag = {
      url = "github:windwp/nvim-ts-autotag";
      flake = false;
    };
    nvim_context_vt = {
      url = "github:haringsrob/nvim_context_vt";
      flake = false;
    };
    octo-nvim = {
      url = "github:pwntester/octo.nvim";
      flake = false;
    };
    nvim-web-devicons = {
      url = "github:kyazdani42/nvim-web-devicons";
      flake = false;
    };
    nvterm = {
      url = "github:NvChad/nvterm";
      flake = false;
    };
    sort-nvim = {
      url = "github:sQVe/sort.nvim";
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
    winshift-nvim = {
      url = "github:sindrets/winshift.nvim";
      flake = false;
    };
    zen-mode-nvim = {
      url = "github:folke/zen-mode.nvim";
      flake = false;
    };
    nvim-cmp = {
      url = "github:hrsh7th/nvim-cmp";
      flake = false;
    };
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
    onedark-colorscheme = {
      url = "github:navarasu/onedark.nvim";
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
    lspkind-nvim = {
      url = "github:onsails/lspkind.nvim";
      flake = false;
    };
    vim-dadbod-completion = {
      url = "github:kristijanhusak/vim-dadbod-completion";
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
                  edgy-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.edgy-nvim;
                    src = inputs.edgy-nvim;
                  };
                  nvim-cmp = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.nvim-cmp;
                    src = inputs.nvim-cmp;
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
                  lspkind-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.lspkind-nvim;
                    src = inputs.lspkind-nvim;
                  };
                  vim-dadbod-completion = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.vim-dadbod-completion;
                    src = inputs.vim-dadbod-completion;
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
                  onedark-colorscheme = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.onedark-colorscheme;
                    src = inputs.onedark-colorscheme;
                  };
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

                  rose-pine = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.rose-pine;
                    src = inputs.rose-pine;
                  };
                  vim-floaterm = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.vim-floaterm;
                    src = inputs.vim-floaterm;
                  };
                  vim-eunuch = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.vim-eunuch;
                    src = inputs.vim-eunuch;
                  };
                  vim-visual-star-search = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.vim-visual-star-search;
                    src = inputs.vim-visual-star-search;
                  };
                  vim-expand-region = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.vim-expand-region;
                    src = inputs.vim-expand-region;
                  };
                  is-vim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.is-vim;
                    src = inputs.is-vim;
                  };
                  neoconf-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.neoconf-nvim;
                    src = inputs.neoconf-nvim;
                  };
                  neodev-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.neodev-nvim;
                    src = inputs.neodev-nvim;
                  };
                  mason-lspconfig-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.mason-lspconfig-nvim;
                    src = inputs.mason-lspconfig-nvim;
                  };
                  nvim-lspconfig = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.nvim-lspconfig;
                    src = inputs.nvim-lspconfig;
                  };
                  lsp_signature-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.lsp_signature-nvim;
                    src = inputs.lsp_signature-nvim;
                  };
                  vim-mdx-js = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.vim-mdx-js;
                    src = inputs.vim-mdx-js;
                  };
                  nvim-surround = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.nvim-surround;
                    src = inputs.nvim-surround;
                  };
                  auto-session = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.auto-session;
                    src = inputs.auto-session;
                  };
                  plenary-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.plenary-nvim;
                    src = inputs.plenary-nvim;
                  };
                  telescope-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.telescope-nvim;
                    src = inputs.telescope-nvim;
                  };
                  dressing-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.dressing-nvim;
                    src = inputs.dressing-nvim;
                  };
                  comment-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.comment-nvim;
                    src = inputs.comment-nvim;
                  };
                  diffview-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.diffview-nvim;
                    src = inputs.diffview-nvim;
                  };
                  focus-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.focus-nvim;
                    src = inputs.focus-nvim;
                  };
                  formatter-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.formatter-nvim;
                    src = inputs.formatter-nvim;
                  };
                  git-worktree-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.git-worktree-nvim;
                    src = inputs.git-worktree-nvim;
                  };
                  which-key-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.which-key-nvim;
                    src = inputs.which-key-nvim;
                  };
                  gitsigns-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.gitsigns-nvim;
                    src = inputs.gitsigns-nvim;
                  };
                  lualine-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.lualine-nvim;
                    src = inputs.lualine-nvim;
                  };
                  nui-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.nui-nvim;
                    src = inputs.nui-nvim;
                  };
                  noice-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.noice-nvim;
                    src = inputs.noice-nvim;
                  };
                  nvim-lint = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.nvim-lint;
                    src = inputs.nvim-lint;
                  };
                  nvim-osc52 = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.nvim-osc52;
                    src = inputs.nvim-osc52;
                  };
                  nvim-ts-autotag = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.nvim-ts-autotag;
                    src = inputs.nvim-ts-autotag;
                  };
                  nvim_context_vt = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.nvim_context_vt;
                    src = inputs.nvim_context_vt;
                  };
                  octo-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.octo-nvim;
                    src = inputs.octo-nvim;
                  };
                  nvim-web-devicons = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.nvim-web-devicons;
                    src = inputs.nvim-web-devicons;
                  };
                  nvterm = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.nvterm;
                    src = inputs.nvterm;
                  };
                  sort-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.sort-nvim;
                    src = inputs.sort-nvim;
                  };
                  ripgrep = prev.buildPackages.ripgrep;
                  fd = prev.buildPackages.fd;
                  vim-dadbod-ui = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.vim-dadbod-ui;
                    src = inputs.vim-dadbod-ui;
                  };
                  vim-dadbod = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.vim-dadbod;
                    src = inputs.vim-dadbod;
                  };
                  vim-highlightedyank = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.vim-highlightedyank;
                    src = inputs.vim-highlightedyank;
                  };
                  winshift-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.winshift-nvim;
                    src = inputs.winshift-nvim;
                  };
                  zen-mode-nvim = prev.vimUtils.buildVimPlugin {
                    name = baseNameOf inputs.zen-mode-nvim;
                    src = inputs.zen-mode-nvim;
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
