{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user.name = "FloncDev";
      user.email = "37045958+FloncDev@users.noreply.github.com";
      init.defaultBranch = "main";
    };

    # TODO Have GPG key saved with nix config, also this will need to change per-device
    signing.key = "C4BB780AFDE394ED";
  };

  home.packages = with pkgs; [
    gh
    gitmoji-cli
  ];
}
