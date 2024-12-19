{ inputs, pkgs, ... }:
{
  xdg.configFile."qtile" = {
    source = ./src;
    recursive = true;
  };

  services.picom = {
    enable = true;
    # settings = builtins.readFile ./picom.conf;

    shadow = true;
    shadowOffsets = [(-7) (-7)];
    shadowExclude = [
      "name = 'Notification'"
      "class_g = 'Conky'"
      "class_g ?= 'Notify-osd'"
      "class_g = 'Cairo-clock'"
      "_GTK_FRAME_EXTENTS@:c"
      "class_g = 'Dunst'"
    ];

    fade = true;
    fadeSteps = [0.08 0.08];

    inactiveOpacity = 0.95;
    opacityRules = [
      "100:_NET_WM_STATE@[0]:32a = '_NET_WM_STATE_FULLSCREEN'"
      "100:_NET_WM_STATE@[1]:32a = '_NET_WM_STATE_FULLSCREEN'"
      "100:_NET_WM_STATE@[2]:32a = '_NET_WM_STATE_FULLSCREEN'"
      "100:_NET_WM_STATE@[3]:32a = '_NET_WM_STATE_FULLSCREEN'"
      "100:_NET_WM_STATE@[4]:32a = '_NET_WM_STATE_FULLSCREEN'"
    ];

    backend = "xrender";
    vSync = true;

    settings = {
      corner-radius = 5;
    };
  };
}
