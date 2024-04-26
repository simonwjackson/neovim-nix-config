{pkgs}: {
  packages = [
  ];

  environment = {
  };

  replace = {
    todoComments = pkgs.awesomeNeovimPlugins.todo-comments-nvim;
    plenary = pkgs.awesomeNeovimPlugins.plenary-nvim;
  };
}
