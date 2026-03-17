# TODO: Use something like nixvim? Also setup an actual vim config :)
{
  flake.modules.homeManager.neovim =
    { pkgs, ... }:
    {
      programs.neovim = {
        enable = true;
        vimAlias = true;
        withNodeJs = true;
      };

      # home.packages = with pkgs; [

      # ];
    };
}
