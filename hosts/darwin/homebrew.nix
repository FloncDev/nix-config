{ pkgs, ... }:
{

  homebrew = {
    enable = true;
    casks = [
      "firefox"
    ];
  };
}
