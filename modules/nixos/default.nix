{
  pkgs,
  host,
  lib,
  username,
  inputs,
  config,
  ...
}:
{
  imports = [
    ./user.nix
    ./steam.nix
    ./keyd.nix
    ./nordvpn.nix
  ];

  hardware = {
    graphics = {
      enable = true;
      extraPackages = [ pkgs.mesa ];
    };

    # TODO: Move all graphics and audio stuff to display/
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
    };

    bluetooth = {
      enable = true;
      settings = {
        General.DeviceId = "bluetooth:004C:0000:0000";
      };
    };
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = false;
      wireplumber.enable = true;
    };

    dbus.enable = true;
    pulseaudio.enable = false;
    gnome.gnome-keyring.enable = true;

    libinput.mouse = {
      accelProfile = "flat";
      accelSpeed = "-2.8";
    };

    xserver = {
      enable = false;
      xkb.layout = "us";

      windowManager.qtile.enable = false;
      videoDrivers = [ "nvidia" ];
    };

    earlyoom = {
      enable = true;
      enableNotifications = true;
      freeMemThreshold = 7;
      freeMemKillThreshold = 2;
    };

    hardware.openrgb.enable = true;
    blueman.enable = true;
    joycond.enable = true;

    # displayManager.lemurs = {
    #   enable = true;
    # settings = {

    # };
    # };

    openvpn = {
      #enable = true;
      servers.nordvpn = {
        config = ''
              config /etc/nixos/udp2.ovpn
          	  auth-user-pass /etc/nixos/nord.auth
          	'';
        autoStart = false;
      };
    };
  };

  environment.etc."lemurs/wayland/hyprland" = {
    text = ''
      exec Hyprland
    '';
    mode = "0755";
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 10;
    };

    kernelPackages = pkgs.linuxPackages_latest;

    # extraModulePackages = with config.boot.kernelPackages; [
    #   v4l2loopback
    # ];
    # extraModprobeConfig = ''
    #   options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    # '';

    kernel.sysctl."kernel.sysrq" = 1;

    blacklistedKernelModules = [ "nouveau" ];
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
    polkit.enable = true;
    sudo = {
      extraConfig = ''
        Defaults pwfeedback
      '';

      extraRules = [
        {
          # Don't require password for shutdown
          groups = [ "wheel" ];
          commands = [
            {
              command = "/run/current-system/sw/bin/poweroff";
              options = [ "NOPASSWD" ];
            }
            {
              command = "/run/current-system/sw/bin/shutdown";
              options = [ "NOPASSWD" ];
            }
            {
              command = "/run/current-system/sw/bin/reboot";
              options = [ "NOPASSWD" ];
            }
          ];
        }
      ];
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    # configPackages = [ pkgs.xdg-desktop-portal-hyprland ];
    config.common.default = "xdg-desktop-portal-hyprland";
  };

  environment.systemPackages = with pkgs; [
    pulseaudioFull
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    libnotify
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    nix-your-shell
    # gnupg
  ];

  # TODO: Move this when making WM stuff into modules
  # This should be in the hyprland config but I need it in a nixos module :(
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  flonc.services.custom.nordvpn.enable = true;

  virtualisation.docker.enable = true;

  programs.nix-ld.enable = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  system.stateVersion = "24.05";
}
