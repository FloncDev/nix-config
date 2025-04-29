{ pkgs, config, ... }:
{
  imports = [
    ./waybar.nix
    ./hyprpaper.nix
    ./mako.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$terminal" = "kitty";
      "$mod" = "SUPER";

      monitor = [
        "DP-1, 1920x1080, 1920x0, 1"
        "HDMI-A-1, 1920x1080, 0x0, 1"
      ];

      input = {
        kb_options = "caps:swapescape";
        accel_profile = "flat";
        sensitivity = 0;
        follow_mouse = 2;
      };

      general = {
        gaps_out = 10;
        resize_on_border = true;
        no_border_on_floating = true;
        "col.active_border" = "rgba(ffffff99)";
      };

      decoration = {
        rounding = 3;
        inactive_opacity = 0.96;
      };

      bind = [
        "$mod, w, killactive"
        "$mod, space, exec, rofi -show run"

        # Workspaces
        "$mod, 1, focusworkspaceoncurrentmonitor, 1"
        "$mod, 2, focusworkspaceoncurrentmonitor, 2"
        "$mod, 2, focusworkspaceoncurrentmonitor, 2"
        "$mod, 3, focusworkspaceoncurrentmonitor, 3"
        "$mod, 4, focusworkspaceoncurrentmonitor, 4"
        "$mod, 5, focusworkspaceoncurrentmonitor, 5"
        "$mod, 6, focusworkspaceoncurrentmonitor, 6"
        "$mod, 7, focusworkspaceoncurrentmonitor, 7"
        "$mod, 8, focusworkspaceoncurrentmonitor, 8"
        "$mod, 9, focusworkspaceoncurrentmonitor, 9"
        "$mod, 0, focusworkspaceoncurrentmonitor, 10"

        # Move to workspaces
        "$mod SHIFT, 1, movetoworkspace,1"
        "$mod SHIFT, 2, movetoworkspace,2"
        "$mod SHIFT, 3, movetoworkspace,3"
        "$mod SHIFT, 4, movetoworkspace,4"
        "$mod SHIFT, 5, movetoworkspace,5"
        "$mod SHIFT, 6, movetoworkspace,6"
        "$mod SHIFT, 7, movetoworkspace,7"
        "$mod SHIFT, 8, movetoworkspace,8"
        "$mod SHIFT, 9, movetoworkspace,9"
        "$mod SHIFT, 0, movetoworkspace,10"

        # Focus next monitor
        "$mod, grave, focusmonitor, +1"

        # Move focus
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"

        "$mod, left, movefocus, l"
        "$mod, down, movefocus, d"
        "$mod, up, movefocus, u"
        "$mod, right, movefocus, r"

        "$mod, tab, cyclenext"
        "$mod SHIFT, tab, cyclenext, prev"

        # Toggle monitors
        "$mod, r, dpms, toggle"

        # Window states
        "$mod, f, fullscreen"
        "$mod, s, togglefloating"
        "$mod, p, pin"

        # Apps
        "$mod ALT, f, exec, ${pkgs.firefox}/bin/firefox"
        "$mod, return, exec, $terminal"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
      ];

      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "NIXOS_OZONE_WL=1"
        "HYORCURSOR_THEME,rose-pine-hyprcursor"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
      ];

      layerrule = [
        "blur, waybar, ignorealpha"
      ];

      cursor = {
        inactive_timeout = 0;
        no_hardware_cursors = true;
      };

      exec-once = [ "waybar" ];
    };
  };
}
