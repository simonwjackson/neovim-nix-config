{pkgs}: {
  packages = [
    pkgs.neovim-remote
    pkgs.lazygit
  ];
  replace = {
    whichKey = pkgs.awesomeNeovimPlugins.which-key-nvim;
  };
}
