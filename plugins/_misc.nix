{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    # oneDark = pkgs.vimPlugins.onedark-colorscheme;
    oneDark = pkgs.awesomeNeovimPlugins.onedark-nvim;
    rosePine = pkgs.awesomeNeovimPlugins.rose-pine-neovim;
    # INFO: some of these need to be moved to other plugins
    vimVisualStarSearch = pkgs.vimPlugins.vim-visual-star-search;
    nvimLspconfig = pkgs.vimPlugins.nvim-lspconfig;
    lspSignature = pkgs.awesomeNeovimPlugins.lsp-signature-nvim;
    nvimSurround = pkgs.vimPlugins.nvim-surround;
    autoSession = pkgs.vimPlugins.auto-session;
    plenaryNvim = pkgs.awesomeNeovimPlugins.plenary-nvim;
    telescopeNvim = pkgs.vimPlugins.telescope-nvim;
    dressingNvim = pkgs.vimPlugins.dressing-nvim;
    commentNvim = pkgs.vimPlugins.comment-nvim;
    diffviewNvim = pkgs.vimPlugins.diffview-nvim;
    focusNvim = pkgs.vimPlugins.focus-nvim;
    whichKeyNvim = pkgs.vimPlugins.which-key-nvim;
    gitsignsNvim = pkgs.vimPlugins.gitsigns-nvim;
    lualineNvim = pkgs.vimPlugins.lualine-nvim;
    nuiNvim = pkgs.vimPlugins.nui-nvim;
    noiceNvim = pkgs.vimPlugins.noice-nvim;
    nvimLint = pkgs.vimPlugins.nvim-lint;
    nvimOsc52 = pkgs.vimPlugins.nvim-osc52;
    nvimTsAutotag = pkgs.vimPlugins.nvim-ts-autotag;
    nvimContextVt = pkgs.vimPlugins.nvim_context_vt;
    octoNvim = pkgs.vimPlugins.octo-nvim;
    nvimWebDevicons = pkgs.vimPlugins.nvim-web-devicons;
    nvterm = pkgs.vimPlugins.nvterm;
    sortNvim = pkgs.vimPlugins.sort-nvim;
    ripgrep = pkgs.ripgrep;
    fd = pkgs.fd;
    vimDadbodUi = pkgs.vimPlugins.vim-dadbod-ui;
    vimDadbod = pkgs.vimPlugins.vim-dadbod;
    vimDadbodCompletion = pkgs.vimPlugins.vim-dadbod-completion;
    vimHighlightedyank = pkgs.vimPlugins.vim-highlightedyank;
    winshiftNvim = pkgs.vimPlugins.winshift-nvim;
    zenModeNvim = pkgs.vimPlugins.zen-mode-nvim;
    mkdir = pkgs.awesomeNeovimPlugins.mkdir-nvim;
    chainsaw = pkgs.awesomeNeovimPlugins.nvim-chainsaw;
    pqf = pkgs.awesomeNeovimPlugins.nvim-pqf;
    neodim = pkgs.awesomeNeovimPlugins.neodim;
    overseer = pkgs.awesomeNeovimPlugins.overseer-nvim;
  };
}
#
