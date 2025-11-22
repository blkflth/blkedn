{lib, ...}: {
  imports = [
    ./web.nix
    ./fish.nix
    ./editors.nix
    ./ghostty.nix
    ./tui.nix
  ];

  programs.feh.enable = true; #image viewer
}
