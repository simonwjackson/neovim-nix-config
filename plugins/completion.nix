{pkgs}: {
  packages = [
    pkgs.luajitPackages.luacheck
  ];
  replace = {
    nvimCmp = pkgs.awesomeNeovimPlugins.nvim-cmp;
    luaSnip = pkgs.awesomeNeovimPlugins.LuaSnip;
    cmpLuaSnip = pkgs.vimPlugins.cmp_luasnip;
    cmpNvimLua = pkgs.vimPlugins.cmp-nvim-lua;
    cmpNvimLsp = pkgs.vimPlugins.cmp-nvim-lsp;
    cmpBuffer = pkgs.vimPlugins.cmp-buffer;
    cmpPath = pkgs.vimPlugins.cmp-path;
    cmpCmdline = pkgs.vimPlugins.cmp-cmdline;
    cmpNvimLspSignatureHelp = pkgs.vimPlugins.cmp-nvim-lsp-signature-help;
    lspkindNvim = pkgs.vimPlugins.lspkind-nvim;
    vimDadbodCompletion = pkgs.vimPlugins.vim-dadbod-completion;
    cmpTreesitter = pkgs.vimPlugins.cmp-treesitter;
    cmpSpell = pkgs.vimPlugins.cmp-spell;
    cmpEmoji = pkgs.vimPlugins.cmp-emoji;
    cmpCalc = pkgs.vimPlugins.cmp-calc;
    cmpNpm = pkgs.vimPlugins.cmp-npm;
  };
}
