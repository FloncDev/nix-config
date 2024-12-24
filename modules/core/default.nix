{ host, username, pkgs, ... }:
{
  nix = {
    optimise.automatic = true;
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
  networking.hostName = "${host}";
  time.timeZone = "Europe/London";
  nixpkgs.config.allowUnfree = true;
}
