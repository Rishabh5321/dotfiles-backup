{
  config,
  pkgs-unstable,
  inputs,
  ...
}:
{
  programs.wezterm = {
    enable = false;
  };
}
