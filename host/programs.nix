{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  blender-pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/9957cd48326fe8dbd52fdc50dd2502307f188b0d.tar.gz";
  }) {};

  blender-3_6 = blender-pkgs.blender-hip;
in {
  # See what of these can be put in home-manager
  environment.systemPackages = with pkgs; [
    # system tools
    bluez-headers # bluetooth enabling
    alejandra #nix language formatting
    nix-init #tool of building packages
    unar #unarchive tools
    glibc #c language library
    dosfstools #create and check V/FAT file systems
    gnumake # 'make' commands
    wev #find keystrokes for wayland compsitor; helpful when altering keybinds
    nix-output-monitor
    nvd

    # git
    git
    gh #github cli tools

    # package managers
    wget
    curl
    apt

    #Languages
    python3 #python

    cargo #rust package manager
    rustfmt #formatter
    rustc #rust compiler
    clippy #language interpreter
    rustup #toolchain installer

    rustlings #rust edu tool
    rustycli # rust plasyground in terminal
    rust-script #run expressions as scripts

    # hardware control
    lm_sensors #tool for scanning system fans
    lact #GPU config tool
    amdctl #CPU config tool

    # display shenangians
    inputs.noctalia.packages.${system}.default #Noctalia input
    xdg-utils
    xdg-desktop-portal-gtk
    xdg-desktop-portal-termfilechooser
    xwayland-satellite

    # general use and media
    # kdePackages.dolphin # KDE file browser
    nautilus #GNOME file browser
    vlc
    obs-studio
    nicotine-plus # soulseek client
    picard # music metadata editor
    feishin # Subsonic interface
    ani-cli #CLI anime streaming

    # Creative Software
    davinci-resolve
    gimp3-with-plugins
    inkscape-with-extensions
    obsidian # Notes organization
    blender-3_6

    # productivity
    xournalpp #Notetaking
    libreoffice-fresh # Office Suite

    # game/3d tools
    protonup-ng #installed proton GE
    protonup-qt #GUI for managing Proton GE
    winetricks #etxra wine DLLs

    haskellPackages.gi-gst #enable streaming media

    mangohud #process overlay
    lutris
    xivlauncher

    #enable streaming media
    gst_all_1.gst-plugins-ugly
    haskellPackages.gi-gst

    # styling tools
    bibata-cursors
    catppuccin-cursors
    nerd-fonts.atkynson-mono
    montserrat
    noto-fonts-emoji-blob-bin
    adwaita-icon-theme
    inputs.matugen.packages.x86_64-linux.default #matugen input

    # custom packages
    fchat-horizon
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    fchat-horizon = pkgs.callPackage ~/Documents/Packages/Horizon/fchat-horizon.nix {};
  };

  # Enable programs defined by Home Manager modules.

  programs = {
    coolercontrol.enable = true;
    steam.enable = true;
    steam.gamescopeSession.enable = true;
    gamemode.enable = true;
    virt-manager.enable = true;
    firefox.enable = true;
    # enable Niri Window Manager - NixOS source in flake, builds using cachix
    niri.enable = true;
    niri.package = pkgs.niri-stable;
  };
  niri-flake.cache.enable = false; #uncomment once cache is built

  # cachix sources
  nix.settings = {
    substituters = [
      "https://vicinae.cachix.org"
    ];

    trusted-public-keys = [
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
    ];
  };
}
