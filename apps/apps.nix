{lib, ...}: {
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
      addons = [
        pkgs.ankiAddons.anki-connect
        pkgs.ankiAddons.review-heatmap
        pkgs.ankiAddons.recolor
      ];
      sync = {
        autoSync = true;
      };
    };
  };
}
