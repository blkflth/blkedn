{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./web.nix
    ./fish.nix
    ./editors.nix
    ./ghostty.nix
    ./tui.nix
  ];

  programs = {
    feh = {
      enable = true; #image viewer
    };
    anki = {
      enable = true;
      theme = "dark";
      style = "native";
      addons = with pkgs.ankiAddons; [
        anki-connect
        review-heatmap
        recolor
      ];
      sync = {
        autoSync = true;
      };
    };
  };
}
