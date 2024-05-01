{pkgs}: {
  packages = [
    pkgs.ripgrep
  ];

  environment = {
  };

  replace = {
    just = pkgs.vimPlugins.tree-sitter-just;
    animation = pkgs.awesomeNeovimPlugins.animation-nvim;
    betterEscape = pkgs.awesomeNeovimPlugins.better-escape-nvim;
    boole = pkgs.awesomeNeovimPlugins.boole-nvim;
    buffDelete = pkgs.awesomeNeovimPlugins.bufdelete-nvim;
    chainsaw = pkgs.awesomeNeovimPlugins.nvim-chainsaw;
    cutlass = pkgs.awesomeNeovimPlugins.cutlass-nvim;
    diffview = pkgs.awesomeNeovimPlugins.diffview-nvim;
    detour = pkgs.vimPlugins.detour;
    dressing = pkgs.awesomeNeovimPlugins.dressing-nvim;
    gitBlame = pkgs.awesomeNeovimPlugins.git-blame-nvim;
    gitDev = pkgs.awesomeNeovimPlugins.git-dev-nvim;
    isVim = pkgs.vimPlugins.is-vim;
    lspSignature = pkgs.awesomeNeovimPlugins.lsp-signature-nvim;
    middleclass = pkgs.vimPlugins.middleclass;
    mkdir = pkgs.awesomeNeovimPlugins.mkdir-nvim;
    neodim = pkgs.awesomeNeovimPlugins.neodim;
    numb = pkgs.awesomeNeovimPlugins.numb-nvim;
    nvimScrollbar = pkgs.awesomeNeovimPlugins.nvim-scrollbar;
    nvimSpectre = pkgs.awesomeNeovimPlugins.nvim-spectre;
    obsidian = pkgs.awesomeNeovimPlugins.obsidian-nvim;
    oneDark = pkgs.awesomeNeovimPlugins.onedark-nvim;
    overseer = pkgs.awesomeNeovimPlugins.overseer-nvim;
    plenary = pkgs.awesomeNeovimPlugins.plenary-nvim;
    pqf = pkgs.awesomeNeovimPlugins.nvim-pqf;
    rosePine = pkgs.awesomeNeovimPlugins.rose-pine-neovim;
    sentiment = pkgs.awesomeNeovimPlugins.sentiment-nvim;
    smartSplits = pkgs.awesomeNeovimPlugins.smart-splits-nvim;
    surround = pkgs.awesomeNeovimPlugins.nvim-surround;
    telescope = pkgs.awesomeNeovimPlugins.telescope-nvim;
    telescopeTabs = pkgs.awesomeNeovimPlugins.telescope-tabs;
    telescopeUndo = pkgs.awesomeNeovimPlugins.telescope-undo-nvim;
    vimHighlightedyank = pkgs.vimPlugins.vim-highlightedyank;
    vimVisualStarSearch = pkgs.vimPlugins.vim-visual-star-search;
    windows = pkgs.awesomeNeovimPlugins.windows-nvim;
  };
}
