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
  environment.systemPackages = with pkgs-unstable; [
    github-desktop
    heroic
    inputs.nix-software-center.packages.${system}.nix-software-center
    inputs.alejandra.defaultPackage.${system}
    lutris
    protonup-qt
    rquickshare
    zed-editor
    wezterm
    vscode
    #plex
  ];
  #services.plex.enable = true;
  #services.hypridle.enable = true;
}
