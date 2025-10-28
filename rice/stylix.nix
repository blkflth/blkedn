{ pkgs, host, lib, ... }:

{
    stylix = {
        base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-medium.yaml";
            # url didn't work for as yet unknown reason so the written out scheme is as follows:
            /* {
                scheme = "Everforest Dark Medium"; author = "Sainnhe Park (https://github.com/sainnhe)";
                base00 = "#2d353b"; # default darker bg, bg0
                base01 = "#343f44"; # dark bg, bg1
                base02 = "#3d484d"; # least dark bg, bg2
                base03 = "#475258"; # bright bg, bg3
                base04 = "#7a8478"; # dark fg, gray0
                base05 = "#859289"; # default fg, gray1
                base06 = "#9da9a0"; # light fg, gray2
                base07 = "#d3c6aa"; # lightest fg, fg
                base08 = "#e67e80"; # red
                base09 = "#e69875"; # orange
                base0A = "#dbbc7f"; # yellow
                base0B = "#a7c080"; # green
                base0C = "#83c092"; # cyan, aqua
                base0D = "#7fbbb3"; # blue
                base0E = "#d699b6"; # purple
                base0F = "#514045"; # dark red or brown, bg_visual
            }; */
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
