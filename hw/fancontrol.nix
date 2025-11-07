{pkgs, ...}: {
  home.packages = with pkgs; [
    fanctl
    lm_sensors
  ];
}
