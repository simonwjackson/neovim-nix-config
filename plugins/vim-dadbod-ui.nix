{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    vimDadbodUi = pkgs.vimPlugins.vim-dadbod-ui;
    vimDadbod = pkgs.vimPlugins.vim-dadbod;
    vimDadbodCompletion = pkgs.vimPlugins.vim-dadbod-completion;
  };
}
