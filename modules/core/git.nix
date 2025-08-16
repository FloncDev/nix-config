{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    userName = "FloncDev";
    userEmail = "37045958+FloncDev@users.noreply.github.com";

    # TODO Have GPG key saved with nix config, also this will need to change per-device
    signing.key = "C4BB780AFDE394ED";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  home.packages = with pkgs; [
    gh
    gitmoji-cli
  ];
}
