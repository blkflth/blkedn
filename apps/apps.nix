{lib, ...}: {
  imports = [
    ./web.nix
    #./zsh.nix
    ./fish.nix
    ./editors.nix
    ./ghostty.nix
    ./tui.nix
  ];
}
