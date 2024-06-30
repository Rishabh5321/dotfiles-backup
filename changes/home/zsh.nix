{ hostname, config, pkgs, host, username, wallpaper, ...}: 
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };
    initExtraFirst = ''
      DISABLE_MAGIC_FUNCTIONS=true
      export "MICRO_TRUECOLOR=1"
      eval "$(atuin init zsh)"
      fastfetch
      #exec Hyprland
    '';
    shellAliases = {
      # record = "wf-recorder --audio=alsa_output.pci-0000_08_00.6.analog-stereo.monitor -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')";
      
      # Utils
      c = "clear";
      cd = "z";
      tt = "gtrash put";
      cat = "bat";
      nano = "micro";
      #code = "vscode";
      py = "python";
      icat = "kitten icat";
      dsize = "du -hs";
      findw = "grep -rl";

      l = "eza --icons  -a --group-directories-first -1"; #EZA_ICON_SPACING=2
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";

      # Nixos
      cdnix = "cd ~/zaneyos && code ~/zaneyos";
      ns = "nix-shell --run zsh";
      nix-shell = "nix-shell --run zsh";
      #nix-switch = "nh os switch ~/zaneyos";
      #nix-switchu = "nh os switch -u ~/zaneyos && swww img /home/${username}/Pictures/Wallpapers/${wallpaper}";
      #nix-flake-update = "sudo nix flake update ~/zaneyos#";
      nix-clean = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";
      
      # python
      piv = "python -m venv .venv";
      psv = "source .venv/bin/activate";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}