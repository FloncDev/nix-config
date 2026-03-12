{ inputs, ... }:
{
  flake.modules.nixos.default = {
    imports = with inputs.self.modules.nixos; [
      minimal
      home-manager
      networking
      ssh
    ];

  };

  flake.modules.homeManager.default = {
    imports = with inputs.self.modules.homeManager; [
      minimal
      shell
    ];
  };
}
