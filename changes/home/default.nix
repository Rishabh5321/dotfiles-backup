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
        ./bat.nix
        ./cava.nix
        ./zsh.nix
        ./chromium.nix
        ./hypridle.nix
    ];

}