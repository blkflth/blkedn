{ config, ... }:
# Start the following programs at launch
{

    programs.niri.settings.spawn-at-startup = [
        { argv = [ "vesktop" ]; }
        { argv = [ "firefox" ]; }
        { command = [ "btm" ]; }
        { command = [ "microfetch" ]; }
    ];

}
