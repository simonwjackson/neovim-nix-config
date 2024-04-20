{
  pkgs,
  self,
  neovim ? pkgs.neovim-unwrapped,
}: let
  plugins = pkgs.callPackage ./plugins.nix {};
  treesitter-parsers = pkgs.symlinkJoin {
    name = "treesitter-parsers";
    # Todo: move into nix plugin file as `runtimes`
    paths = [
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.lua])).dependencies
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.nix])).dependencies
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.bash])).dependencies
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.json])).dependencies
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.typescript])).dependencies
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.javascript])).dependencies
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.python])).dependencies
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.markdown])).dependencies
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.vim])).dependencies
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.vimdoc])).dependencies
    ];
  };
  neovimConfig = pkgs.runCommandNoCC "neovimConfig" {} ''
    mkdir -p $out/nvim/lua
    cat ${self}/config/init.lua > $out/nvim/init.lua

    cat >> $out/nvim/init.lua <<EOF
      vim.opt.rtp:prepend("${pkgs.vimPlugins.lazy-nvim}")
      require("lazy").setup("plugins", {
        root = vim.fn.stdpath("run") .. "/lazy",
        lockfile = vim.fn.stdpath("run") .. "/lazy/lazy-lock.json", -- lockfile generated after running update.
      })

      -- Add Treesitter Parsers Path
      vim.opt.runtimepath:prepend("${treesitter-parsers}")
      vim.opt.runtimepath:prepend("${pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.yaml])}")
    EOF

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
