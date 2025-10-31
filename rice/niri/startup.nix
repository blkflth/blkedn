{ config, inputs, pkgs, ... }:
# Start the following programs at launch
{

    programs.niri.settings.spawn-at-startup = [
        { argv = [ "vesktop" ]; }
        { argv = [ "firefox" ]; }
        { sh = "btm"; }
        { sh = "microfetch"; }
    ];

}
