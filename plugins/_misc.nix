{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    oneDark = pkgs.vimPlugins.onedark-colorscheme;
    rosePine = pkgs.vimPlugins.rose-pine;
    # INFO: some of these need to be moved to other plugins
    vimFloaterm = pkgs.vimPlugins.vim-floaterm;
    vimEunuch = pkgs.vimPlugins.vim-eunuch;
    vimVisualStarSearch = pkgs.vimPlugins.vim-visual-star-search;
    vimExpandRegion = pkgs.vimPlugins.vim-expand-region;
    isVim = pkgs.vimPlugins.is-vim;
    neoconfNvim = pkgs.vimPlugins.neoconf-nvim;
    neodevNvim = pkgs.vimPlugins.neodev-nvim;
    masonLspconfigNvim = pkgs.vimPlugins.mason-lspconfig-nvim;
    nvimLspconfig = pkgs.vimPlugins.nvim-lspconfig;
    lspSignatureNvim = pkgs.vimPlugins.lsp_signature-nvim;
    vimMdxJs = pkgs.vimPlugins.vim-mdx-js;
    nvimSurround = pkgs.vimPlugins.nvim-surround;
    autoSession = pkgs.vimPlugins.auto-session;
    plenaryNvim = pkgs.vimPlugins.plenary-nvim;
    telescopeNvim = pkgs.vimPlugins.telescope-nvim;
    dressingNvim = pkgs.vimPlugins.dressing-nvim;
    commentNvim = pkgs.vimPlugins.comment-nvim;
    diffviewNvim = pkgs.vimPlugins.diffview-nvim;
    focusNvim = pkgs.vimPlugins.focus-nvim;
    gitWorktreeNvim = pkgs.vimPlugins.git-worktree-nvim;
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
  };
}
