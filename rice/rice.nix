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
    colorScheme = "dark";
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
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
    gtk4.theme = config.gtk.theme;
  };

  gtk.gtk2.force = true;
  xdg.configFile."gtk-4.0/gtk.css".force = true;
  xdg.configFile."gtk-4.0/settings.ini".force = true;
}
