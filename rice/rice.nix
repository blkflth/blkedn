{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    ./vicinae.nix
    ./noctalia.nix
    ./niri.nix
  ];

  gtk = {
    enable = true;
    font = {
      name = "AtkynsonMono NFP";
      package = pkgs.nerd-fonts.atkynson-mono;
      size = 12;
    };

    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };

    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };

  gtk.gtk2.force = true;
}
