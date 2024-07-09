{
  config,
  pkgs,
  ...
}:
{
  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];
  home.packages = [
    pkgs.conky
  ];
  home.file = { 
    ".config/autostart/conky.desktop".text = ''
      [Desktop Entry]
      Comment[en_US]=System Monitor
      Comment=System Monitor
      Encoding=UTF-8
      TryExec=conky
      Exec=conky -p 10 -d -b -c "/home/${config.home.username}/.config/conky/conky.conf"
      GenericName[en_US]=
      GenericName=
      Hidden=false
      MimeType=
      Name[en_US]=Conky
      Name=Conky
      Path=
      Icon=conky-logomark-violet
      StartupNotify=false
      Terminal=false
      TerminalOptions=
      Type=Application
      X-DBUS-ServiceName=
      X-DBUS-StartupType=
      NotShowIn=i3;sway;hyprland;
    '';
    ".config/conky/conky.conf".text = ''
      conky.config = {
        alignment = "top_right",
        background = false,
        border_width = 0,
        cpu_avg_samples = 2,
        default_color = 'ebdbb2',
        default_outline_color = 'ebdbb2',
        default_shade_color = 'ebdbb2',
        draw_borders = false,
        draw_graph_borders = false,
        draw_outline = false,
        draw_shades = false,
        use_xft = true,
        font = "IBM Plex Mono:size=8",
        gap_x = 10,
        gap_y = 30,
        minimum_height = 5,
        minimum_width = 5,
        net_avg_samples = 2,
        no_buffers = true,
        out_to_console = false,
        out_to_stderr = false,
        extra_newline = false,
        own_window = true,
        own_window_class = "Conky",
        own_window_type = "normal",
        own_window_transparent = true,
        own_window_argb_visual = true,
        own_window_argb_value = 100,
        own_window_hints = "undecorated,below,sticky,skip_taskbar,skip_pager",
        stippled_borders = 0,
        update_interval = 2.0,
        uppercase = false,
        use_spacer = "none",
        show_graph_scale = false,
        show_graph_range = false
      }

      conky.text = [[
      ''${font IBM Plex Mono:Medium:size=20}''${time %H:%M}''${font}
      ''${font IBM Plex Mono:size=10}''${time %A %Y-%m-%d}''${font}
      $hr
      ]];
    '';
  };
}
