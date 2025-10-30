{ config, inputs, pkgs, ... }:
# Start the following programs at launch
{

    programs.niri.settings.spawn-at-startup = [
        { argv = [ "vesktop" ]; }
        { argv = [ "firefox" ]; }
        { argv = [ "btm" ]; }
        { argv = [ "microfetch" ]; }
        { argv = [ "noctalia-shell" ]; }
    ];

}
