{ config, pkgs, ... }:

{
  home.username = "jlc";
  home.homeDirectory = "/home/jlc";

  imports = [
  ./rice/rice.nix
  ./apps/apps.nix
  ./hw/hw.nix
  ];

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

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

  # probably will move this and other fonts to a dedicated file
    nerd-fonts.atkynson-mono
  ];

 # home.file = {

 # };

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.home-manager.enable = true;
}
