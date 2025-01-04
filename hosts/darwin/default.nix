{ lib, inputs, username, pkgs, host, ... }:
{
  imports = [
  inputs.home-manager.darwinModules.home-manager
    ../../modules/core
    # ./homebrew.nix
    # ../../modules/darwin
  ];

  users = {
    knownUsers = [ "${username}" ];
    users.${username} = {
      home = "/Users/${username}";
      # Apparently needed
      uid = 501;
    };
  };

  nixpkgs.overlays = [ inputs.nixpkgs-firefox-darwin.overlay ];

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
      AppleICUForce24HourTime = false;
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

  security.pam.enableSudoTouchIdAuth = true;

  # Temp while I'm setting up
  environment.systemPackages = with pkgs; [
    neovim
  ];

  system.stateVersion = 5;
}
