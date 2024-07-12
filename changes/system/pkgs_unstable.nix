{
  config,
  pkgs-unstable,
  host,
  inputs,
  username,
  options,
  ...
}: {
  environment.systemPackages = let
  in
    with pkgs-unstable; [
      github-desktop
      heroic
      inputs.nix-software-center.packages.${system}.nix-software-center
      inputs.alejandra.defaultPackage.${system}
      kdeconnect
      lutris
      protonup-qt
      rquickshare
      zed-editor
      vscode
      #plex
    ];
  #services.plex.enable = true;
  #services.hypridle.enable = true;
}
