{ lib, inputs, username, pkgs, host, ... }:
{
  imports = [
  inputs.home-manager.darwinModules.home-manager
    ../../modules/core
    # ../../modules/darwin
  ];

  users.users.${username}.home = "/Users/${username}";

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    
    extraSpecialArgs = { inherit inputs username host; };

    users.${username} = {
      imports = [
        # ../../modules/core
        ../../modules/darwin
        ../../modules/darwin/home.nix 
        ../../modules/apps
      ];
      home.username = "${username}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  system.defaults = {
    NSGlobalDomain = {
      "com.apple.swipescrolldirection" = false;
    };

    dock = {
      autohide = true;
      autohide-delay = 0.0;
      tilesize = 40;
      persistent-apps = [];
      show-recents = false;
    };

    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
    };

    controlcenter.BatteryShowPercentage = true;

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

  # Temp while I'm setting up
  environment.systemPackages = with pkgs; [
    neovim
  ];

  system.stateVersion = 5;
}
