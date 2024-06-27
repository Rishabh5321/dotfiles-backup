{
  description = "ZaneyOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #firefox-gnome-theme = { url = "github:rafaelmardojai/firefox-gnome-theme"; flake = false; };
    stylix.url = "github:danth/stylix";
    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
    };
    fine-cmdline = {
      url = "github:VonHeikemen/fine-cmdline.nvim";
      flake = false;
    };
    # This is required for plugin support.
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
     hyprland-plugins = {
       url = "github:hyprwm/hyprland-plugins";
       inputs.hyprland.follows = "hyprland";
     };
  };

  outputs =
    { nixpkgs, home-manager, sddm-sugar-candy-nix, ... }@inputs:
    let
      system = "x86_64-linux";
      host = "dell";
      username = "rishabh";
      wallpaper = "wall16.png";
    in
    {
      nixosConfigurations = {
        "${host}" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
            inherit username;
            inherit host;
            inherit wallpaper;
          };
          modules = [
            ./hosts/${host}/config.nix
            inputs.stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            sddm-sugar-candy-nix.nixosModules.default
            {
              nixpkgs = {
                overlays = [
                  sddm-sugar-candy-nix.overlays.default
                ];
              };
              home-manager.extraSpecialArgs = {
                inherit username;
                inherit inputs;
                inherit host;
                inherit wallpaper;
              };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.${username} = import ./hosts/${host}/home.nix;
            }
          ];
        };
      };
    };
}