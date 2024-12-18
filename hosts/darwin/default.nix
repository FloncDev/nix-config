{ ... }:
{
  # imports = [./];


  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0;
    };
  };

  programs.fish.enable = true;

  # Don't change unless I figure out wtf im doing lmao
  system.stateVersion = 5;
}
