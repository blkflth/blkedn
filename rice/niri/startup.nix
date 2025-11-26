{
  config,
  inputs,
  pkgs,
  ...
}:
# Start the following programs at launch
{
  programs.niri.settings.spawn-at-startup = [
    {sh = "noctalia-shell";}
    {argv = ["vesktop"];}
    {argv = ["firefox"];}
  ];
}
