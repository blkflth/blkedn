{ config, inputs, pkgs, ... }:
# Start the following programs at launch
{

    programs.niri.settings.spawn-at-startup = [
        { argv = [ "vesktop" ]; }
        { argv = [ "firefox" ]; }
        #{ argv = [ "ghostty" "-e" "btm" ]; }
        #{ argv = [ "ghostty" "microfetch" ]; }
    ];

}
 