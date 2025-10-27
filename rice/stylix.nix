{ pkgs, host, lib, ... }:

{
    stylix = {
        enable = true;
        polarity = "dark";
        opacity.terminal = 1.0;
        cursor = {
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Ice";
            size = 24;
        };
        fonts = {
            monospace = {
                package = pkgs.nerd-fonts.atkynson-mono;
                name = "Atkynson Mono";
            };
            sansSerif = {
                package = pkgs.montserrat;
                name = "Montserrat";
            };
            serif = {
                package = pkgs.montserrat;
                name = "Montserrat";
            };
            sizes = {
                applications = 12;
                terminal = 15;
                desktop = 11;
                popups = 12;
                };
        };
    };
}
