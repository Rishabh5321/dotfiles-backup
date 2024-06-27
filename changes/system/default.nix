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
        ./boot.nix
        ./cache.nix
        ./displaymanager.nix
        ./gaming.nix
        ./pkgs.nix
        ./proton.nix
        ./upgrade.nix
    ];
}