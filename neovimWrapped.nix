{
  pkgs,
  self,
  neovim ? pkgs.neovim-unwrapped,
}: let
  plugins = pkgs.callPackage ./plugins.nix {};
  neovimConfig = pkgs.runCommandNoCC "neovimConfig" {} ''
    mkdir -p $out/nvim/lua
    cp -r ${self}/config/* $out/nvim/
    ln -s ${plugins}/* $out/nvim/lua
  '';
in
  pkgs.writeShellScriptBin "nvim" ''
    export PATH="$PATH:${pkgs.lib.makeBinPath (import ./get-packages.nix {inherit pkgs;})}"

    ${import ./get-env-vars.nix {inherit pkgs;}}
    ${import ./get-env-files.nix {inherit pkgs;}}

    ${pkgs.lib.getExe neovim} \
      --clean \
      --cmd 'set rtp+=${neovimConfig}/nvim/' \
      -u ${neovimConfig}/nvim/init.lua \
      "$@"
  ''
