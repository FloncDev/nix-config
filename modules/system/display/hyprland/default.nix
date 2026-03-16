{ inputs, ... }:
{
  flake-file.inputs = {
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
  };

  flake.modules.nixos.hyprland =
    { pkgs, ... }:
    {
      home-manager.sharedModules = [
        inputs.self.modules.homeManager.hyprland
      ];

      programs.hyprland = {
        enable = true;
        withUWSM = true;
      };

      environment.systemPackages = with pkgs; [
        inputs.rose-pine-hyprcursor.packages.${stdenv.hostPlatform.system}.default
        libnotify
        xdg-desktop-portal
        xdg-desktop-portal-hyprland
      ];
    };

  flake.modules.homeManager.hyprland =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.homeManager; [
        mako
        hyprpaper
        waybar
      ];

      wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;

        settings = {
          "$terminal" = "kitty";
          "$mod" = "SUPER";

          # TODO: Monitor config in machine

          input = {
            accel_profile = "flat";
            sensitivity = 0;
            follow_mouse = 2;
            numlock_by_default = true;
          };

          general = {
            gaps_out = 10;
            resize_on_border = true;
            # no_border_on_floating = true;
            "col.active_border" = "rgba(ffffff99)";
          };

          decoration = {
            rounding = 3;
            inactive_opacity = 0.96;
            blur = {
              special = true;
              passes = 2;
            };
          };

          dwindle = {
            preserve_split = true;
            smart_split = false; # Also enables preserve_split
          };

          bind = [
            "$mod, q, killactive"
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
            "$mod, f2, workspace, name:games"

            "ALT, tab, togglespecialworkspace"

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
            "$mod SHIFT, f2, movetoworkspace, name:games"

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
            # TODO: Move to machine
            # "$mod Control_L, r, dpms, toggle HDMI-A-1"
            # "$mod SHIFT, r, dpms, toggle DP-3"

            # Window states
            "$mod, f, fullscreen"
            "$mod, s, togglefloating"
            "$mod, p, pin"

            # Apps
            "$mod ALT, f, exec, ${pkgs.firefox}/bin/firefox"
            "$mod, return, exec, $terminal"

            # Mute Mic
            # TODO: Move to machine
            # ", mouse:277, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"

            # Screenshots
            ", Print, exec, hyprshot -m region --clipboard-only"
            "SHIFT, Print, exec, hyprshot -m window -m active --clipboard-only"
            "Control_L, Print, exec, hyprshot -m output -m active --clipboard-only"

            # Emoji picker
            "$mod, period, exec, smile"

            # TODO: Move to machine
            # # Toggle lights
            # ", XF86Tools, exec, bash /etc/nixos/modules/display/scripts/toggle_light.sh"
            # "Control_L, XF86Tools, exec, bash /etc/nixos/modules/display/scripts/toggle_light.sh light.light_pwm_led"
            # "Control_R, XF86Tools, exec, bash /etc/nixos/modules/display/scripts/toggle_light.sh light.light_pwm_led"

            # # Brightness control - default light
            # "$mod, Prior, exec, bash /etc/nixos/modules/display/scripts/brightness_light.sh 25"
            # "$mod, Next, exec, bash /etc/nixos/modules/display/scripts/brightness_light.sh -25"

            # # Brightness control - alternate light
            # "Control_L, Prior, exec, bash /etc/nixos/modules/display/scripts/brightness_light.sh light.light_pwm_led 25"
            # "Control_L, Next, exec, bash /etc/nixos/modules/display/scripts/brightness_light.sh light.light_pwm_led -25"
            # "Control_R, Prior, exec, bash /etc/nixos/modules/display/scripts/brightness_light.sh light.light_pwm_led 25"
            # "Control_R, Next, exec, bash /etc/nixos/modules/display/scripts/brightness_light.sh light.light_pwm_led -25"
          ];

          binds = {
            drag_threshold = 10;
          };

          bindm = [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
          ];

          # TODO:
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
            "XDG_CURRENT_DESKTOP,Hyprland"
            "GBM_BACKEND,nvidia-drm"
          ];

          layerrule = [
            {
              name = "Fix waybar blur";
              ignore_alpha = 0;
              "match:namespace" = "waybar";
            }
          ];

          windowrule = [
            # "workspace 2 silent, class:vesktop"
            # "noinitialfocus, class:vesktop"
            # "stayfocused, class:Rofi"
            # "opacity 1, content:video"
            # "float, class:it.mijorus.smile"

            "match:class vesktop, workspace 2 silent"
            "match:class vesktop, no_initial_focus on"
            "match:class Spotify, workspace special silent"
            "match:class Rofi, stay_focused on"
            "match:content video, opacity 1"
            "match:class it.mijorus.smile, float on"
          ];

          # TODO: Move some to machine
          workspace = [
            # "1, monitor:DP-3"
            "s[true], gapsout:100"
            # "name:games, monitor:DP-1, shadow:false, decorate:false, rounding:false, border:false, gapsout:0"
          ];

          cursor = {
            inactive_timeout = 10;
            no_hardware_cursors = true;
          };

          debug = {
            disable_logs = false;
          };

          exec-once = [
            "waybar"
            "hyprpaper"
            "[workspace 1 silent] firefox"
            "[workspace 2 silent] vesktop"
            "[workspace special silent] spotify"
          ];

        };

      };

      services.playerctld.enable = true;

      home.packages = with pkgs; [
        # TODO: Nice rofi config :)
        rofi
        hyprshot
        playerctl
      ];

    };
}
