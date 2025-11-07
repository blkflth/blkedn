{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  # Mount Points for SSDs
  fileSystems."/run/media/jlc/SSD One" = {
    device = "/dev/disk/by-uuid/0A4A387B4A38661B";
    fsType = "ntfs3";
    options = ["nofail" "defaults"];
  };

  fileSystems."/run/media/jlc/SSD Two" = {
    device = "/dev/disk/by-uuid/7ABA5750BA570851";
    fsType = "ntfs3";
    options = ["nofail" "defaults"];
  };

  fileSystems."/run/media/jlc/SSD Three" = {
    device = "/dev/disk/by-uuid/027CB1E67CB1D49F";
    fsType = "ntfs3";
    options = ["nofail" "defaults"];
  };
}
