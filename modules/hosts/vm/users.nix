{ inputs, ... }:
{
  flake.modules.nixos.vm = {
    imports = with inputs.self.modules.nixos; [
      flonc
      # More users can be added here..
    ];

    # I can split the users into seperate files if I wanted to do extra
    # config for this machine per user like below
    home-manager.users.flonc = {
      # ...
    };
  };
}
