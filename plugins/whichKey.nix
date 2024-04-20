{pkgs}: {
  packages = [
    pkgs.neovim-remote
    pkgs.lazygit
  ];
  replace = {
    whichKey = pkgs.vimPlugins.which-key;
  };
}
