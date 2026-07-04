{ ... }:
{
  flake.modules.homeManager.anki = { osConfig, ... }: {
    programs.anki = {
      enable = true;

      profiles.main = {
        default = true;
      };
    };
  };
}
