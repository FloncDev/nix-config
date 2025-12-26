{ ... }:
{
  services.keyd = {
    enable = true;

    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            #capslock = "overload(control, esc)";
	    capslock = "esc";
            esc = "capslock";
          };
        };
      };
    };
  };
}
