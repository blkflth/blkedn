{
  config,
  inputs,
  pkgs,
  ...
}:
# Start the following programs at launch
{
  programs.niri.settings.spawn-at-startup = [
    # {command = ["noctalia-shell"];}
    {sh = "noctalia-shell";}
    {argv = ["vesktop"];}
    #{argv = ["firefox"];}
  ];
}
