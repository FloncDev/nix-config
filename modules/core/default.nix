{ host, username, pkgs, inputs, ... }:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager.users.${username}.imports = [ ./home.nix ];
  nix = {
    # optimize.automatic = true;
    extraOptions = "trusted-users = ${username} root";
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
      allowed-users = [
        "${username}"
        "root"
      ];
    };
  };

  users.users.${username} = {
    # isNormalUser = true;
    description = "${username}";
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
  programs.gnupg.agent.enable = true;
  networking.hostName = "${host}";
  services.tailscale.enable = true;
  time.timeZone = "Europe/London";
  nixpkgs.config.allowUnfree = true;
}
