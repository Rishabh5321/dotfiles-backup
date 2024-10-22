{ pkgs, wallpaperDir, ... }:
pkgs.writeShellScriptBin "wallSelector" ''
  chosen=$(ls ${wallpaperDir} | grep "wall*" | ${pkgs.rofi-wayland}/bin/rofi -dmenu -p "Select a wallpaper")

  [ -z "$chosen" ] && exit;

  ${pkgs.swww}/bin/swww img ${wallpaperDir}/$chosen
''
