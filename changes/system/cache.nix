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
      nix.settings = {
        builders-use-substitutes = true;
        substituters = [
          "https://cache.nixos.org?priority=10"
          "https://hyprland.cachix.org"
          "https://nix-community.cachix.org"
          "https://nixpkgs-wayland.cachix.org"
          #"https://cache.garnix.io"
        ];
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
          #"cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        ];
      };
}