{ ... }:
{
  home.file.".config/waybar/style.css".source = ./style.css;

  catppuccin.waybar.mode = "createLink";

  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "right";
        reload_style_on_change = true;
        output = [ "DP-1" ];
        margin = "10 10 10 0";

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [
          "custom/power"
          "custom/lock"
        ];
        modules-right = [
          "tray"
          "memory"
          "clock"
        ];

        "hyprland/workspaces" = {
          # all-outputs = false;
          persistent-workspaces = {
            "*" = [
              1
              2
              3
              4
              5
              6
              7
              8
              9
              10
            ];
          };
          move-to-monitor = true;
        };

        clock = {
          interval = 1;
          format = "{:%I%n%M%n%S}";
          tooltip-format = "{:%Y-%m-%d}";
        };

        memory = {
          interval = 10;
          states = {
            warning = 80;
            critical = 95;
          };
        };

        "group/group-power" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            children-class = "power-buttons";
            transition-left-to-right = false;
          };
          modules = [
            "custom/power"
            "custom/lock"
          ];
        };

        "custom/power" = {
          format = "";
          tooltip = false;
          on-click = "shutdown now";
        };

        "custom/lock" = {
          format = "󰍁";
          tooltip = false;
          on-click = "hyprctl dispatch lock";
        };

      };
    };
  };
}

# "1": "",
#  "2": "",
#  "3": "",
#  "4": "",
#  "5": "",
#  "urgent": "",
#  "active": "",
#  "default": ""
