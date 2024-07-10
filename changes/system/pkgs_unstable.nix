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
      heroic
      inputs.nix-software-center.packages.${system}.nix-software-center
      kdeconnect
      lutris
      protonup-qt
      rquickshare
      vscode
      #plex
    ];
    #services.plex.enable = true;
    #services.hypridle.enable = true;
}
