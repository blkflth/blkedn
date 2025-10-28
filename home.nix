{ config, pkgs, ... }:

{
  home.username = "jlc";
  home.homeDirectory = "/home/jlc";

  imports = [
  ./rice/rice.nix
  ./apps/apps.nix
  ./hw/hw.nix
  ];

  home.stateVersion = "25.05"; # Don't Change This.

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
  # Best these live here
    glibc
    wget
    curl
    apt
    git
    wev
    gh
    nh
    xdg-utils
    xdg-desktop-portal-gtk
    gnumake
    kdePackages.dolphin
    protonup
    fuzzel
    mangohud
    unar
  ];

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.catppuccin-cursors;
    name = "frappeDark";
    size = 24;
  };
    /* debug this - deleting this file every build is annoying.
  home-manager.users.username = {
    xdg.configFile."/home/jlc/.gtkrc-2.0".force = true;
    };
    */
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.home-manager.enable = true;
}
