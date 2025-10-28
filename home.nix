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

  home.packages = with pkgs; [
  # Best these live here
    glibc
    wget
    curl
    apt
    git
    gh
    nh
    xdg-utils
    xdg-desktop-portal-gtk
    gnumake
    kdePackages.dolphin
    protonup
    fuzzel
    mangohud
  ];

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.catpuccin-cursors;
    name = "frappeDark";
    size = 24;
  };

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.home-manager.enable = true;
}
