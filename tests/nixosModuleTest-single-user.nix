{
  self,
  pkgs,
  ...
}:
pkgs.testers.runNixOSTest {
  name = "minimal-test";

  nodes.system-wide = {
    config,
    pkgs,
    ...
  }: {
    imports = [
      self.nixosModules.default
    ];

    programs.myNeovim.enable = true;
    programs.myNeovim.users = ["alice"];

    users.users.alice = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      packages = [
      ];
    };

    system.stateVersion = "23.11";
  };

  testScript = ''
    machine.wait_for_unit("default.target")
    machine.fail("su -- root -c 'which nvim'")
    machine.succeed("su -- alice -c 'which nvim'")
  '';
}
