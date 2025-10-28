{ config, ... }:
# Start the following programs at launch
{
    programs.niri.settings.spawn-at-startup = {
    "vesktop";
  # "proton-mail";
    "firefox";
    "btm";
    "microfetch";
    };
}
