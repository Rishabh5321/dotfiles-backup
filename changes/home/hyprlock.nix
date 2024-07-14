{
  config,
  wallpaper,
  username,
  ...
}:
let
  color0 = "rgb(${config.stylix.base16Scheme.base00})";
  color2 = "rgb(${config.stylix.base16Scheme.base02})";
  color5 = "rgb(${config.stylix.base16Scheme.base05})";
  color8 = "rgb(${config.stylix.base16Scheme.base08})";
  color10 = "rgb(${config.stylix.base16Scheme.base0A})";
  color14 = "rgb(${config.stylix.base16Scheme.base0E})";
in
{
  programs.hyprlock = {
    enable = true;

    sourceFirst = true;

    settings = {
      # GENERAL
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      # BACKGROUND
      background = [
        {
          path = "/home/${username}/Pictures/Wallpapers/${wallpaper}";
          blur_passes = 3;
          blur_size = 8;
          noise = 1.17e-2;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
          color = color0;
        }
      ];

      # TIME
      label = [
        {
          text = "cmd[update:30000] echo \"$(date +\"%I:%M %p\")\"";
          color = color5;
          font_size = 90;
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          text = "cmd[update:43200000] echo \"$(date +\"%A, %d %B %Y\")\"";
          color = color5;
          font_size = 25;
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];

      # INPUT FIELD
      input-field = [
        {
          size = "300, 60";
          outline_thickness = 4;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = color14;
          inner_color = color2;
          font_color = color5;
          fade_on_empty = false;
          placeholder_text = "<i>󰌾 Logged in as </i>$USER";
          hide_input = false;
          check_color = color14;
          fail_color = color8;
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = color10;
          position = "0, -35";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
