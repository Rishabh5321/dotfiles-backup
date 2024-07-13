
### Flake Info

```nix
Resolved URL:  git+file:///home/runner/work/dotfiles/dotfiles?shallow=1
Locked URL:    git+file:///home/runner/work/dotfiles/dotfiles?shallow=1
Description:   Rishabh's Laptop
Path:          /nix/store/vwn89dhfsdws7c9yi6y6hp1ch4cahhfi-source
Revision:      99fa25f352779e826953db8f9fc556ae9d0eb824-dirty
Last modified: 2024-07-13 10:41:26
Inputs:
├───alejandra: github:kamadorueda/alejandra/d7552fef2ccf1bbf0d36b27f6fddb19073f205b7 (2024-06-27 18:52:01)
│   ├───fenix: github:nix-community/fenix/8f219f6b36e8d0d56afa7f67e6e3df63ef013cdb (2022-11-12 06:27:33)
│   │   ├───nixpkgs follows input 'alejandra/nixpkgs'
│   │   └───rust-analyzer-src: github:rust-lang/rust-analyzer/45ec315e01dc8dd1146dfeb65f0ef6e5c2efed78 (2022-11-11 15:57:30)
│   ├───flakeCompat: github:edolstra/flake-compat/b4a34015c698c7793d592d66adbab377907a2be8 (2022-04-19 13:22:48)
│   └───nixpkgs follows input 'nixpkgs'
├───fine-cmdline: github:VonHeikemen/fine-cmdline.nvim/dd676584145d62b30d7e8dbdd011796a8f0a065f (2023-11-20 20:39:34)
├───home-manager: github:nix-community/home-manager/90ae324e2c56af10f20549ab72014804a3064c7f (2024-07-11 21:48:33)
│   └───nixpkgs follows input 'nixpkgs'
├───hyprland: git+https://github.com/hyprwm/Hyprland?ref=refs/heads/main&rev=f85c6416c6f5e56c75178ecb24c11e346069197d&submodules=1 (2024-07-12 21:05:19)
│   ├───hyprcursor: github:hyprwm/hyprcursor/a5c0d57325c5f0814c39110a70ca19c070ae9486 (2024-07-04 15:59:59)
│   │   ├───hyprlang follows input 'hyprland/hyprlang'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprlang: github:hyprwm/hyprlang/5df0174fd09de4ac5475233d65ffc703e89b82eb (2024-07-07 19:42:53)
│   │   ├───hyprutils follows input 'hyprland/hyprutils'
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprutils: github:hyprwm/hyprutils/6174a2a25f4e216c0f1d0c4278adc23c476b1d09 (2024-07-09 17:11:16)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───hyprwayland-scanner: github:hyprwm/hyprwayland-scanner/d5fa094ca27e0039be5e94c0a80ae433145af8bb (2024-07-05 21:44:17)
│   │   ├───nixpkgs follows input 'hyprland/nixpkgs'
│   │   └───systems follows input 'hyprland/systems'
│   ├───nixpkgs: github:NixOS/nixpkgs/feb2849fdeb70028c70d73b848214b00d324a497 (2024-07-09 16:33:20)
│   ├───systems: github:nix-systems/default-linux/31732fcf5e8fea42e59c2488ad31a0e651500f68 (2023-07-14 15:19:09)
│   └───xdph: github:hyprwm/xdg-desktop-portal-hyprland/b9b97e5ba23fe7bd5fa4df54696102e8aa863cf6 (2024-07-05 15:47:46)
│       ├───hyprland-protocols: github:hyprwm/hyprland-protocols/1b61f0093afff20ab44d88ad707aed8bf2215290 (2024-06-18 21:31:54)
│       │   ├───nixpkgs follows input 'hyprland/xdph/nixpkgs'
│       │   └───systems follows input 'hyprland/xdph/systems'
│       ├───hyprlang follows input 'hyprland/hyprlang'
│       ├───nixpkgs follows input 'hyprland/nixpkgs'
│       └───systems follows input 'hyprland/systems'
├───hyprland-plugins: github:hyprwm/hyprland-plugins/98cb18c6fcfe8196ef4150d09fbae305b7bb2954 (2024-06-30 21:53:43)
│   ├───hyprland follows input 'hyprland'
│   ├───nixpkgs follows input 'hyprland-plugins/hyprland/nixpkgs'
│   └───systems follows input 'hyprland-plugins/hyprland/systems'
├───nix-software-center: github:snowfallorg/nix-software-center/b9e0f53536e1e94e7d8c3cda3c6866b3f9d01386 (2024-05-04 20:56:23)
│   ├───nixos-appstream-data: github:korfuri/nixos-appstream-data/0465d42a4433faa63b7a5eb0b8d397937c9fc13a (2024-04-11 17:59:50)
│   │   ├───flake-utils follows input 'nix-software-center/utils'
│   │   └───nixpkgs follows input 'nix-software-center/nixpkgs'
│   ├───nixpkgs: github:NixOS/nixpkgs/91a22f76cd1716f9d0149e8a5c68424bb691de15 (2023-08-21 17:25:11)
│   └───utils: github:numtide/flake-utils/919d646de7be200f3bf08cb76ae1f09402b6f9b4 (2023-07-11 09:46:48)
│       └───systems: github:nix-systems/default/da67096a3b9bf56a91d16901293e51ba5b49a27e (2023-04-09 08:27:08)
├───nixpkgs: github:NixOS/nixpkgs/a046c1202e11b62cbede5385ba64908feb7bfac4 (2024-07-11 09:45:31)
├───nixpkgs-unstable: github:NixOS/nixpkgs/feb2849fdeb70028c70d73b848214b00d324a497 (2024-07-09 16:33:20)
├───sddm-sugar-candy-nix: gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix/b410c02eb404db9456cce766bd3ff7944a86ccb2 (2024-06-01 11:23:48)
│   └───nixpkgs follows input 'nixpkgs'
├───spicetify-nix: github:Gerg-L/spicetify-nix/45c8a1d76c34d95ff6f948fff8356f46bc8ef48c (2024-07-12 04:11:31)
│   ├───flake-compat: github:edolstra/flake-compat/0f9255e01c2351cc7d116c072cb317785dd33b33 (2023-10-04 13:37:54)
│   └───nixpkgs follows input 'nixpkgs'
└───stylix: github:danth/stylix/29148118cc33f08b71058e1cda7ca017f5300b51 (2024-07-12 21:11:19)
    ├───base16: github:SenchoPens/base16.nix/665b3c6748534eb766c777298721cece9453fdae (2024-02-25 19:47:46)
    │   └───fromYaml: github:SenchoPens/fromYaml/11fbbbfb32e3289d3c631e0134a23854e7865c84 (2023-07-16 23:25:21)
    ├───base16-fish: github:tomyun/base16-fish/2f6dd973a9075dabccd26f1cded09508180bf5fe (2021-06-01 15:05:57)
    ├───base16-foot: github:tinted-theming/base16-foot/eedbcfa30de0a4baa03e99f5e3ceb5535c2755ce (2023-10-08 00:45:48)
    ├───base16-helix: github:tinted-theming/base16-helix/34f41987bec14c0f3f6b2155c19787b1f6489625 (2024-07-12 18:43:34)
    ├───base16-kitty: github:kdrag0n/base16-kitty/06bb401fa9a0ffb84365905ffbb959ae5bf40805 (2022-10-05 20:22:08)
    ├───base16-tmux: github:tinted-theming/base16-tmux/c02050bebb60dbb20cb433cd4d8ce668ecc11ba7 (2023-10-08 00:45:02)
    ├───base16-vim: github:tinted-theming/base16-vim/6e955d704d046b0dc3e5c2d68a2a6eeffd2b5d3d (2024-05-19 20:21:23)
    ├───flake-compat: github:edolstra/flake-compat/35bb57c0c8d8b62bbfd284272c928ceb64ddbde9 (2023-01-17 11:47:33)
    ├───gnome-shell: github:GNOME/gnome-shell/0d0aadf013f78a7f7f1dc984d0d812971864b934 (2024-04-21 12:24:51)
    ├───home-manager: github:nix-community/home-manager/e3ad5108f54177e6520535768ddbf1e6af54b59d (2024-05-17 07:24:04)
    │   └───nixpkgs follows input 'stylix/nixpkgs'
    └───nixpkgs: github:NixOS/nixpkgs/ee4a6e0f566fe5ec79968c57a9c2c3c25f2cf41d (2024-05-05 12:27:12)

```

### Flake Outputs

```nix
git+file:///home/runner/work/dotfiles/dotfiles?shallow=1
├───formatter
│   └───x86_64-linux: package 'nixfmt-unstable-2024-03-01'
└───nixosConfigurations
    ├───dell: NixOS configuration
    └───redmi: NixOS configuration

```
