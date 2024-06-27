{
  pkgs,
  lib,
  ...
}: let
  suspendScript = pkgs.writeShellScript "suspend-script" ''
    ${pkgs.pipewire}/bin/pw-cli i all | ${pkgs.ripgrep}/bin/rg running
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';
in {
  home.packages = [pkgs.hypridle];

  xdg.configFile."hypr/hypridle.conf".text = ''
    general {
        lock_cmd = ${lib.getExe pkgs.hyprlock}
        before_sleep_cmd = ${pkgs.systemd}/bin/loginctl lock-session
    }
    # Warn
    listener {
        timeout = 60                            # 9 min
        on-timeout = notify-send "You are idle!" # command to run when timeout has passed
        on-resume = notify-send "Welcome back!"  # command to run when activity is detected after timeout has fired.
    }

    listener {
        timeout = 70                     # 10 min
        on-timeout = loginctl lock-session # command to run when timeout has passed
        on-resume = notify-send "Welcome back to your desktop!"  # command to run when activity is detected after timeout has fired.
    }

    listener {
        timeout = 90                            # 10.5 min
        on-timeout = hyprctl dispatch dpms off  # command to run when timeout has passed
        on-resume = hyprctl dispatch dpms on    # command to run when activity is detected after timeout has fired.
    }

  '';
  
  services.hypridle.enable = true;
}