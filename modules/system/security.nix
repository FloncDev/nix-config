{ ... }:
{
  flake.modules.nixos.security = {
    security = {
      rtkit.enable = true;
      sudo.enable = true;
      polkit.enable = true;
      sudo.extraConfig = ''
        Defaults pwfeedback
      '';
    };
  };
}
