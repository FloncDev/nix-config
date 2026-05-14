# TODO: Use something like nixvim? Also setup an actual vim config :)
{
  flake.modules.homeManager.neovim =
    { ... }:
    {
      programs.neovim = {
        enable = true;
        vimAlias = true;
        withNodeJs = true;
        withRuby = false;
        withPython3 = false;
      };

      # home.packages = with pkgs; [

      # ];
    };
}
