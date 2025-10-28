{ pkgs, host, lib, ... }:

{
    stylix = {
        base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-medium.yaml";
        polarity = "dark";
        opacity.terminal = 1.0;
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
            emoji = {
                package = pkgs.noto-fonts-emoji-blob-bin;
                name = "Noto Color Emoji";
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
