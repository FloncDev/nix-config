{ inputs, username, host, ... }:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  users.users.${username}.home = "/Users/${username}";

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports = [ ./home.nix ];
      home.username = "${username}";
      # home.homeDirectory = "/Users/${username}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };
}
