{ ... }:
{
  flake.modules.homeManager.easyeffects = {
    services.easyeffects = {
      enable = true;
      # TODO: Preset?
    };
  };
}
