{
  config,
  pkgs,
  host,
  inputs,
  username,
  options,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./cava.nix
    ./chromium.nix
    #./conky.nix
    ./direnv.nix
    #./firefox.nix
    ./git.nix
    #./gnome-extensions.nix
    #./gnome.nix
    ./hypridle.nix
    ./hyprlock.nix
    #./idleinhibitor.nix
    ./kitty.nix
    ./spicetify.nix
    ./stylix.nix
    ./zsh.nix
  ];
}
