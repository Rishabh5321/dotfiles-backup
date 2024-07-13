{
  pkgs,
  config,
  lib,
  ...
}:
let
  inherit (import ../system/variables.nix) alacritty;
in
lib.mkIf alacritty {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding.x = 15;
        padding.y = 15;
        decorations = "none";
        startup_mode = "Windowed";
        dynamic_title = true;
        opacity = 0.8;
      };
      cursor = {
        style = {
          shape = "Beam";
          blinking = "On";
        };
      };
      live_config_reload = true;
      font = {
        normal.family = "JetBrainsMono Nerd Font Mono";
        bold.family = "JetBrainsMono Nerd Font Mono";
        italic.family = "JetBrainsMono Nerd Font Mono";
        bold_italic.family = "JetBrainsMono Nerd Font Mono";
        size = 15;
      };
    };
  };
}
