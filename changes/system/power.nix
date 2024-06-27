{
  pkgs,
  lib,
  config,
  ...
}: let
  script = pkgs.writeShellScript "power_monitor.sh" ''
    BAT=$(echo /sys/class/power_supply/BAT*)
    BAT_STATUS="$BAT/status"
    BAT_CAP="$BAT/capacity"

    AC_PROFILE="performance"
    BAT_PROFILE="power-saver"

    # wait a while if needed
    [ -z "$STARTUP_WAIT" ] || sleep "$STARTUP_WAIT"

    # start the monitor loop
    currentStatus=$(cat "$BAT_STATUS")
    prevProfile=$AC_PROFILE
    prevStatus=Charging

    # initial run
    if [ "$currentStatus" = "Discharging" ]; then
     	profile="$BAT_PROFILE"
       hyprctl -i 0 --batch 'keyword decoration:blur:enabled false; keyword animations:enabled false'
    else
    	profile="$AC_PROFILE"
       hyprctl -i 0 --batch 'keyword decoration:blur:enabled true; keyword animations:enabled true'
    fi

    # set the new profile
    if [ $prevProfile != "$profile" ]; then
    	echo setting power profile to "$profile"
    	powerprofilesctl set "$profile"
    fi

    prevProfile="$profile"
    prevStatus="$currentStatus"

    # event loop
    while true; do
      currentStatus=$(cat "$BAT_STATUS")
      if [ "$currentStatus" != "$prevStatus" ]; then
      	# read the current state
      	if [ "$currentStatus" = "Discharging" ]; then
        	profile="$BAT_PROFILE"
          hyprctl -i 0 --batch 'keyword decoration:blur:enabled false; keyword animations:enabled false'
      	else
      		profile="$AC_PROFILE"
          hyprctl -i 0 --batch 'keyword decoration:blur:enabled true; keyword animations:enabled true'
      	fi

      	# set the new profile
      	if [ $prevProfile != "$profile" ]; then
      		echo setting power profile to "$profile"
      		powerprofilesctl set "$profile"
      	fi

      	prevProfile="$profile"
        prevStatus="$currentStatus"
      fi

    	# wait for the next power change event
    	inotifywait -qq "$BAT_STATUS" "$BAT_CAP"
    done
  '';

  dependencies = with pkgs; [
    coreutils
    config.wayland.windowManager.hyprland.package
    power-profiles-daemon
    inotify-tools
    jaq
  ];
in {
  # Power state monitor. Switches Power profiles based on charging state.
  # Plugged in - performance
  # Unplugged - power-saver
  systemd.user.services.power-monitor = {
    Unit = {
      Description = "Power Monitor";
      After = ["power-profiles-daemon.service"];
    };

    Service = {
      Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
      Type = "simple";
      ExecStart = script;
      Restart = "on-failure";
    };

    Install.WantedBy = ["default.target"];
  };
}