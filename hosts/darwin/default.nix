{ lib, inputs, username, pkgs, host, ... }:
{
  imports = [
    ../../modules/core
    ../../modules/darwin
  ];

  system.defaults = {
    NSGlobalDomain = {
      "com.apple.swipescrolldirection" = false; };
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      tilesize = 40;
      persistent-apps = [];
      show-recents = false;
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
