{ username, ... }:
{
  home-manager.users.${username} = {
    programs.clock-rs.enable = true;
  };
}
