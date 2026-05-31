# TODO: Maybe refactor this into per-host?
# So far I'll only be using everything here for desktop anyway
{ ... }:
{
  flake.modules.nixos.hardware =
    { pkgs, ... }:
    {
      hardware = {
        graphics = {
          enable = true;
          extraPackages = [ pkgs.mesa ];
        };

        nvidia = {
          modesetting.enable = true;
          open = true;
          nvidiaSettings = true;
        };

        bluetooth = {
          enable = true;
          settings = {
            General = {
              Experimental = true;
              FastConnectable = true;
              Enable = "Source,Sink,Media,Socket";
              # Used for some airpods magic
              # DeviceId = "bluetooth:004C:0000:0000";
            };

            Policy = {
              AutoEnable = "true";
            };
          };
        };
        usb-modeswitch.enable = true;
      };

      services.blueman.enable = true;
    };

}
