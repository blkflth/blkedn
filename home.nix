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
    nix-output-monitor
    nvd
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
    #force override of files so home-manager doesn't throw a warning
  home-manager.users.username = {
    gtk.gtk2.force = true;
    # home.file."".force = true;
    # home.file."".force = true;
    # home.file."".force = true;
    # home.file."".force = true;
    };

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.home-manager.enable = true;
}
