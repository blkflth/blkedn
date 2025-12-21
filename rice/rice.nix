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
    #./matugen.nix
    inputs.matugen.nixosModules.default
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

    /*
      theme = {
      name = "Matugen";
      package = inputs.matugen.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
    */
    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };

  gtk.gtk2.force = true;
  #xdg.configFile."gtk-3.0/gtk.css".source = "${config.programs.matugen.theme.files}/.config/gtk-3.0/gtk.css";

  #xdg.configFile."gtk-4.0/gtk.css".source = "${config.programs.matugen.theme.files}/.config/gtk-4.0/gtk.css";
}
