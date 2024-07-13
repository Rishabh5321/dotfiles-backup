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
    ./bluetooth.nix
    ./boot.nix
    ./cache.nix
    ./desktop_env.nix
    ./displaymanager.nix
    ./gaming.nix
    ./graphics.nix
    ./locale.nix
    ./nix_settings.nix
    ./polkit.nix
    ./pkgs_stable.nix
    ./pkgs_unstable.nix
    ./program.nix
    ./proton.nix
    ./sound.nix
    ./stylix.nix
    ./swap.nix
    ./upgrade.nix
    ./users.nix
  ];
  environment.variables = {
    FLAKE = "~/dotfiles";
    POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };

  environment.systemPackages = with pkgs; [
    (pkgs.writeShellScriptBin "wezterm-new" ''
      #!/bin/bash
      wezterm start --always-new-process "$@"
    '')
  ];
}
