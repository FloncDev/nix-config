{
  host,
  username,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager.users.${username}.imports = [
    ./home.nix
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin.enable = true;

  nix = {
    # optimize.automatic = true;
    extraOptions = "trusted-users = ${username} root";
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
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

  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  nixpkgs.overlays = [
    inputs.nix-your-shell.overlays.default
  ];

  environment.systemPackages = with pkgs; [
    inputs.nix-your-shell
  ];

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
    };
  };

  programs.fish.enable = true;
  programs.gnupg.agent = {
    enable = true;
    # enableExtraSocket = true;
  };
  networking.hostName = "${host}";
  services.tailscale.enable = true;
  time.timeZone = "Europe/London";
  nixpkgs.config.allowUnfree = true;
}
