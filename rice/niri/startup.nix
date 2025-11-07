{
  config,
  inputs,
  pkgs,
  ...
}:
# Start the following programs at launch
{
  programs.niri.settings.spawn-at-startup = [
    /*
    { command = [ "noctalia-shell" ]; }
    */
    {argv = ["vesktop"];}
    {argv = ["firefox"];}
    {argv = ["fchat-horizon"];}
    #{ argv = [ "ghostty" "-e" "btm" ]; }
    #{ argv = [ "ghostty" "microfetch" ]; }
  ];
}
