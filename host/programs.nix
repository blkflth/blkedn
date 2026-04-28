{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  blender = pkgs.blender.override {rocmSupport = true;};
in {
  # See what of these can be put in home-manager
  environment.systemPackages = with pkgs; [
    # system tools
    bluez-headers # bluetooth enabling
    alejandra #nix language formatting
    nix-init #tool of building packages
    xarchiver #GTK frontend for 7zip
    glibc #c language library
    dosfstools #create and check V/FAT file systems
    gnumake # 'make' commands
    wev #find keystrokes for wayland compsitor; helpful when altering keybinds
    nix-output-monitor
    nvd

    # git
    git
    git-crypt #directory and file encryption
    gh #github cli tools

    # package managers
    wget
    curl
    apt
    cargo

    #languages
    python3

    # hardware control
    lm_sensors #tool for scanning system fans
    lact #GPU config tool
    amdctl #CPU config tool

    # display shenangians
    inputs.noctalia.packages.${system}.default #Noctalia input
    xdg-utils
    xdg-desktop-portal-gtk
    xdg-desktop-portal-xapp
    xwayland-satellite
    cmatrix
    gpu-screen-recorder #used for Noctalia's inbuilt function

    # general use and media
    vlc
    ungoogled-chromium
    bazaar #flathub installer
    nicotine-plus # soulseek client
    picard # music metadata editor
    feishin # Subsonic interface
    element-desktop #matrix client
    #ani-cli #CLI anime streaming
    gurk-rs #signal client

    # Creative Software
    obs-studio
    #olive-editor #video editor
    davinci-resolve #video editor
    ffmpeg #video format converter
    gimp-with-plugins
    blender

    # productivity
    libreoffice-fresh # Office Suite
    tagainijisho #Japanese Dictionary
    memento #mpv player for JP Study
    hoard #CLI Command Organizer
    gtt #google translate tui
    tlrc #simiplified man pages written in rust
    tukai #terminal touch-typing practice
    obsidian # Notes organization

    # game/3d tools
    protonup-ng #installed proton GE
    protonup-qt #GUI for managing Proton GE
    winetricks #etxra wine DLLs
    mangohud #process overlay
    lutris
    xivlauncher
    inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.mo2installer #Mod Organizer 2 Client

    # styling tools
    catppuccin-cursors.frappeDark
    font-manager
    adwaita-icon-theme
    dracula-icon-theme
    kdePackages.fcitx5-configtool # IME Config tool

    #greeter theme
    tuigreet
  ];

  # enable flatpaks
  services.flatpak.enable = true;

  # Enable programs defined by Home Manager modules.

  programs = {
    fish.enable = true;
    direnv = {
      enable = true;
      direnvrcExtra = ''

        echo "loaded direnv!"
      '';
    };
    coolercontrol.enable = true;

    steam.enable = true;
    steam.gamescopeSession.enable = true;
    gamemode.enable = true;

    virt-manager.enable = true;
    firefox.enable = true;

    dconf.enable = true;
    xfconf.enable = true; #allow Thunar configs
    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-volman
        thunar-archive-plugin
      ];
    };

    # enable Niri Window Manager - NixOS source in flake, builds using cachix
    niri = {
      enable = true;
      useNautilus = false;
    };
  };

  #workaround for bug in thunar-archive plugin's support for Xarchiver
  nixpkgs.overlays = [
    (final: prev: {
      thunar-archive-plugin = prev.thunar-archive-plugin.overrideAttrs (old: {
        postInstall = ''
          cp ${final.xarchiver}/libexec/thunar-archive-plugin/* $out/libexec/thunar-archive-plugin/
        '';
      });
    })
  ];

  # cachix sources

  nix.settings = {
    substituters = [
      "https://vicinae.cachix.org"
      "https://ezkea.cachix.org"
      "https://nix-gaming.cachix.org"
      #"https://cache.garnix.io"
    ];

    trusted-public-keys = [
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      #"cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };
}
