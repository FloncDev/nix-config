{
  pkgs,
  host,
  lib,
  username,
  inputs,
  ...
}:
{
  imports = [
    ./user.nix
    ./steam.nix
  ];

  hardware = {
    graphics = {
      enable = true;
      extraPackages = [ pkgs.mesa.drivers ];
    };

    pulseaudio.enable = false;

    # TODO: Move all graphics and audio stuff to display/
    nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
    };
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    gnome.gnome-keyring.enable = true;

    libinput.mouse = {
      accelProfile = "flat";
      accelSpeed = "-2.8";
    };

    xserver = {
      enable = true;
      xkb.layout = "us";

      windowManager.qtile.enable = true;
    };

    # TODO: Maybe put this with WM?
    picom.enable = true;
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 10;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    networkmanager.enable = true;
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
      "1.1.1.1"
    ];
    firewall = {
      enable = true;
      # TODO: Figure out how this would work with servers
      allowedTCPPorts = [ 22 ];
      allowedUDPPorts = [ ];
    };
  };

  security = {
    rtkit.enable = true;
    sudo.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pulseaudioFull
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    libnotify
  ];

  # TODO: Move this when making WM stuff into modules
  # This should be in the hyprland config but I need it in a nixos module :(
  programs.hyprland.enable = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  system.stateVersion = "24.05";
}
