{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
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
  ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.home-manager.enable = true;
}
