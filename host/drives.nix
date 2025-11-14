{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  # Mount Points for SSDs
  fileSystems."/home/jlc/SSD1" = {
    device = "/dev/disk/by-uuid/97f253c7-bac6-43d3-b8a9-cc0903c15b7f";
    fsType = "ext4";
    options = ["nofail" "defaults"];
  };

  fileSystems."/home/jlc/SSD2" = {
    device = "/dev/disk/by-uuid/10690921-7698-4027-a3c2-2df47ceaa7d7";
    fsType = "ext4";
    options = ["nofail" "defaults"];
  };

  fileSystems."/home/jlc/SSD3" = {
    device = "/dev/disk/by-uuid/659ff393-6687-4c0f-becc-dae68e26f986";
    fsType = "ext4";
    options = ["nofail" "defaults"];
  };
}
