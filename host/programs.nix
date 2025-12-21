{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  /*
    blender-pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/ae5fe741ba9acade281a9185139e3922811c9696.tar.gz";
    sha256 = "18w4aa58lw82x79r4js2ppnq0d5xccfmic7r9n404lh9a6njdfjm";
  }) {};
  */
  blender = pkgs.blender.override {hipSupport = true;};

  aagl-gtk-on-nix = import (builtins.fetchTarball "https://github.com/ezKEa/aagl-gtk-on-nix/archive/release-25.11.tar.gz");
in {
  imports = [
    aagl-gtk-on-nix.module
  ];
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

    # general use and media

    vlc
    nicotine-plus # soulseek client
    picard # music metadata editor
    feishin # Subsonic interface
    element-desktop #matrix client
    ani-cli #CLI anime streaming

    # Creative Software

    obs-studio
    olive-editor #video editor
    davinci-resolve #video editor
    ffmpeg #video format converter
    obsidian # Notes organization
    blender

    # productivity
    xournalpp #Notetaking
    libreoffice-fresh # Office Suite

    # game/3d tools
    protonup-ng #installed proton GE
    protonup-qt #GUI for managing Proton GE
    winetricks #etxra wine DLLs

    #enable streaming media
    # gst_all_1.gst-plugins-ugly
    # haskellPackages.gi-gst

    mangohud #process overlay
    lutris
    xivlauncher

    # styling tools
    catppuccin-cursors.frappeDark
    font-manager
    adwaita-icon-theme
    dracula-icon-theme
    kdePackages.fcitx5-configtool # IME Config tool
    inputs.matugen.packages.x86_64-linux.default #matugen input
    dconf-editor
    dconf2nix

    #greeter theme
    tuigreet
  ];

  # Enable programs defined by Home Manager modules.

  programs = {
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

    honkers-railway-launcher.enable = true;

    virt-manager.enable = true;
    firefox.enable = true;

    dconf.enable = true;
    xfconf.enable = true; #allow Thunar configs
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-volman
        thunar-archive-plugin
      ];
    };

    # enable Niri Window Manager - NixOS source in flake, builds using cachix
    niri.enable = true;
    niri.package = pkgs.niri-stable;
  };
  niri-flake.cache.enable = false; #uncomment once cache is built

  # cachix sources

  nix.settings = {
    substituters = [
      "https://vicinae.cachix.org"
      "https://ezkea.cachix.org"
      "https://cache.garnix.io"
    ];

    trusted-public-keys = [
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };
}
