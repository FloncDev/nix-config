{ lib, inputs, username, pkgs, host, ... }:
{
  # imports = [./];

  nix = 
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        experimental-features = "flakes nix-command";
        warn-dirty = false;
        trusted-users = [
          "root"
          "${username}"
        ];
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
  };

  programs.fish.enable = true;
  environment.shells = [pkgs.fish];
  users.users.${username}.shell = pkgs.fish;

  # Temp while I'm setting up
  environment.systemPackages = with pkgs; [
    kitty
    neovim
  ];

  services.tailscale.enable = true;

  networking.hostName = "${host}";

  # Don't change unless I figure out wtf im doing lmao
  system.stateVersion = 5;
}
