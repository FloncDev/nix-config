{ inputs, ... }:
{
  flake.modules.nixos.default =
    { lib, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        minimal
        home-manager

        # Under modules/system/
        networking
        ssh
        security
      ];

      services.automatic-timezoned.enable = lib.mkDefault true;
      programs.nix-ld.enable = true;
      virtualisation.docker.enable = true;
      i18n.defaultLocale = "en_GB.UTF-8";
    };

  flake.modules.homeManager.default = {
    imports = with inputs.self.modules.homeManager; [
      minimal
      shell
      git
    ];
  };
}
