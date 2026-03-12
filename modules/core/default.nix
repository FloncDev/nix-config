{ inputs, ... }:
{
  flake.modules.nixos.default = {
    imports = with inputs.self.modules.nixos; [
      minimal
      home-manager
      networking
    ];

  };

  flake.modules.homeManager.default = {
    imports = with inputs.self.modules.homeManager; [
      minimal
      shell
    ];
  };
}
