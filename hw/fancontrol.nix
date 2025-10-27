{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fanctl
    lm_sensors
  ];
  services = {
    hardware.fancontrol.enable = true;
  };
}
