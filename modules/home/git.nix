{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    userName = "FloncDev";
    userEmail = "37045958+FloncDev@users.noreply.github.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  home.packages = with pkgs; [
    gh
    gitmoji-cli
  ];
}
