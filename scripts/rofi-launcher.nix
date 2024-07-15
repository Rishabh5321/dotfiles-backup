{ pkgs }:
pkgs.writeShellScriptBin "rofi-launcher" ''
  if pgrep -x "rofi" > /dev/null; then
    # Rofi is running, kill it
    pkill -x rofi
    exit 0
  fi

  # Ensure Rofi is running with Wayland support
  export GDK_BACKEND=wayland
  export QT_QPA_PLATFORM=wayland

  # Launch Rofi with layer shell protocol
  rofi -show drun
''
