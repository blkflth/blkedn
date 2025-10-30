{ config, pkgs, inputs, ... }:

{
  home.username = "jlc";
  home.homeDirectory = "/home/jlc";

  imports = [
  inputs.vicinae.homeManagerModules.default
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
    mangohud
    unar
    #fuzzel

    ];

   services.vicinae = {
        enable = true; # default: false
        autoStart = true; # default: true
    };

  /*
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.catppuccin-cursors;
    name = "frappeDark";
    size = 24;
  };
  */

    #force override of files so home-manager doesn't throw a warning

    gtk.gtk2.force = true;
   # home.file.".config/gtk-3.0".force = true;
   # home.file.".config/gtk-3.0/settings.ini".force = true;
   # home.file.".config/gtk-4.0/".force = true;
   # home.file.".config/gtk-4.0/settings.ini".force = true;

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.home-manager.enable = true;
}
