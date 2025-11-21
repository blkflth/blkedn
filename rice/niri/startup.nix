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
    #{sh = "systemctl --user reset-failed waybar.service";}
    {argv = ["vesktop"];}
    {argv = ["firefox"];}
  ];
}
