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

  xdg.configFile."mpv/script-opts/subs2srs.conf".source = ./subs2srs.conf;

  programs = {
    feh = {
      enable = true; #image viewer
    };
    /*
    anki = {
      enable = true;
      theme = "dark";
      style = "native";
      addons = with pkgs.ankiAddons; [
        anki-connect
      ];
      sync = {
        autoSync = true;
      };
    };
    */
  };
}
