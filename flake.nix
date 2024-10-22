{
  description = "Rishabh's Laptop";

  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #firefox-gnome-theme = { url = "github:rafaelmardojai/firefox-gnome-theme"; flake = false; };
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fine-cmdline = {
      url = "github:VonHeikemen/fine-cmdline.nvim";
      flake = false;
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    # hyprland.inputs.nixpkgs.follows = "nixpkgs";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alejandra.url = "github:kamadorueda/alejandra";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-software-center.url = "github:snowfallorg/nix-software-center";
    nix-software-center.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixpkgs-unstable,
      sddm-sugar-candy-nix,
      alejandra,
      spicetify-nix,
      #wezterm,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      host = "dell";
      username = "rishabh";
      wallpaper = "wall13.jpg";
      pkgs-unstable = import nixpkgs-unstable {
        system = "x86_64-linux";
        config = {
          allowUnfree = true;
          allowUnfreePredicate = _: true;
        };
      };
    in
    {
      nixosConfigurations = {
        "redmi" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
            inherit username;
            inherit host;
            inherit wallpaper;
            inherit pkgs-unstable;
          };
          modules = [
            ./hosts/redmi/config.nix
            inputs.stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            sddm-sugar-candy-nix.nixosModules.default
            {
              nixpkgs = {
                overlays = [ sddm-sugar-candy-nix.overlays.default ];
              };
              home-manager.extraSpecialArgs = {
                inherit username;
                inherit inputs;
                inherit host;
                inherit wallpaper;
                inherit spicetify-nix;
                inherit pkgs-unstable;
              };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "rebuild";
              home-manager.users.${username} = import ./hosts/redmi/home.nix;
            }
          ];
        };
        "dell" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
            inherit username;
            inherit host;
            inherit wallpaper;
            inherit pkgs-unstable;
          };
          modules = [
            ./hosts/dell/config.nix
            inputs.stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            sddm-sugar-candy-nix.nixosModules.default
            {
              nixpkgs = {
                overlays = [ sddm-sugar-candy-nix.overlays.default ];
              };
              home-manager.extraSpecialArgs = {
                inherit username;
                inherit inputs;
                inherit host;
                inherit wallpaper;
                inherit spicetify-nix;
                inherit pkgs-unstable;
              };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "rebuild";
              home-manager.users.${username} = import ./hosts/dell/home.nix;
            }
          ];
        };
      };
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    };
}
