{
  config,
  pkgs,
  host,
  inputs,
  username,
  options,
  ...
}: 
{
    imports = [
        #./firefox.nix
        ./direnv.nix
        #./bat.nix
        ./cava.nix
        #./conky.nix
        #./idleinhibitor.nix
        #./gnome.nix
        #./gnome-extensions.nix
        ./git.nix
        #./pfetch.nix
        ./stylix.nix
        ./zsh.nix
        ./chromium.nix
        ./hypridle.nix
        ./spicetify.nix
    ];
}