{ inputs, ... }:
{
  flake.modules.nixos.default =
    { lib, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        minimal
        home-manager
        secrets

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

  flake.modules.darwin.default = {
    imports = with inputs.self.modules.darwin; [
      minimal
      home-manager
    ];

    system.defaults = {
      NSGlobalDomain = {
        "com.apple.swipescrolldirection" = false;
        AppleICUForce24HourTime = false;
      };

      dock = {
        autohide = true;
        autohide-delay = 0.0;
        tilesize = 40;
        persistent-apps = [ ];
        show-recents = false;
      };

      trackpad = {
        Clicking = true;
        TrackpadRightClick = true;
      };

      controlcenter.BatteryShowPercentage = true;
      menuExtraClock.Show24Hour = false;

      finder = {
        QuitMenuItem = true;
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        AppleShowAllFiles = true;
        ShowPathbar = true;
      };
    };

    system.keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };

    security.pam.services.sudo_local.touchIdAuth = true;
  };

  flake.modules.homeManager.default = {
    imports = with inputs.self.modules.homeManager; [
      minimal
      shell
      git
    ];
  };
}
