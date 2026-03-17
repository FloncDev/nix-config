# Swap escape and caps lock
{ pkgs, ... }:
{
  flake.modules.nixos.keyd = {
    services.keyd = {
      enable = true;

      keyboard = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "esc";
              esc = "capslock";
            };
          };
        };
      };
    };
  };
}
