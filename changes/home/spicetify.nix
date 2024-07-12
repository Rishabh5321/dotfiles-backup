{
  pkgs,
  lib,
  inputs,
  config,
  spicetify-nix,
  ...
}: let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
  palette = config.stylix.base16Scheme;
in {
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];

  # import the flake's module for your system
  imports = [spicetify-nix.homeManagerModule];

  # configure spicetify :)
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Dribbblish;
    colorScheme = "custom";
    customColorScheme = {
      text = "${palette.base0B}";
      subtext = "${palette.base0B}";
      main = "${palette.base00}";
      main-elevated = "${palette.base00}";
      main-transition = "${palette.base00}";
      highlight = "${palette.base01}";
      highlight-elevated = "${palette.base00}";
      sidebar = "${palette.base00}";
      player = "${palette.base00}";
      card = "${palette.base05}";
      shadow = "${palette.base00}";
      selected-row = "${palette.base0B}";
      button = "${palette.base04}";
      button-active = "${palette.base07}";
      button-disabled = "${palette.base03}";
      tab-active = "${palette.base07}";
      notification = "${palette.base0B}";
      notification-error = "${palette.base06}";
      misc = "${palette.base02}";
      progress-fg = "${palette.base07}";
      progress-bg = "${palette.base00}";
      heart = "${palette.base07}";
      pagelink-active = "${palette.base04}";
      radio-btn-active = "${palette.base04}";
    };

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      hidePodcasts
      inputs.spicetify-nix.packages.${pkgs.system}.default.extensions.adblock
    ];
  };
}
