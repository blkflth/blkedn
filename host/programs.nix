{ config, pkgs, inputs, lib, ... }:

{

# See what of these can be put in home-manager
  environment.systemPackages = with pkgs; [
    # system tools
    bluez-headers # bluetooth enabling
    alejandra #nix language formatting
    nix-init #tool of building packages
    unar #unarchive tools
    glibc #c language library
    gnumake # 'make' commands
    wev #find keystrokes for wayland compsitor; helpful when altering keybinds
    nix-output-monitor
    nvd

    docker
    docker-compose

    # git
    git
    gh #github cli tools

    # package managers
    wget
    curl
    apt

    # general use and media
    nautilus #GNOME file browser
    # kdePackages.dolphin # KDE file browser
    davinci-resolve
    gimp3-with-plugins
    inkscape-with-extensions 
    feishin # Subsonic interface
    ani-cli #CLI anime streaming
    nyaa # cli torrent downloader - see if this can be linked to media server
    nicotine-plus # soulseek client

    # music metadata editors
    picard

    /* for hardware control -
    thought these weren't necessary but 
    CoolerControl's daemon was having issues. */
    lm_sensors
    fanctl

    # display shenangians
    xdg-utils
    xdg-desktop-portal-gtk
    xdg-desktop-portal-termfilechooser
    xwayland-satellite

    # styling tools
    # base16-schemes
    inputs.matugen.packages.x86_64-linux.default

    # game/3d tools
    blender
    protonup-ng #installed proton GE
    protonup-qt #GUI for managing Proton GE
    mangohud #process overlay
    # lutris
    xivlauncher

    # cursors + fonts + icons
    bibata-cursors
    catppuccin-cursors
    nerd-fonts.atkynson-mono
    montserrat
    noto-fonts-emoji-blob-bin
    adwaita-icon-theme

  ];

  # enable docker virtualizsation
  virtualisation.docker = {
    enable = true;
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

  # VSCode Config Source

 /*
  programs.vscode = {
    home.file = { 
        ".config/Code/User/settings.json".source = 
        lib.mkForce (
          config.lib.file.mkOutOfStoreSymlink 
          /home/jlc/Nix/settings/vscode-settings.json
        );
    };
  };
*/



}