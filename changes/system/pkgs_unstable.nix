{
  config,
  pkgs-unstable,
  host,
  inputs,
  username,
  options,
  ...
}:
{
    environment.systemPackages = let
    in with pkgs-unstable;
    [
      floorp
      #plex
    ];
    #services.plex.enable = true;
    #services.hypridle.enable = true;
}
