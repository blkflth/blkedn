{ config, pkgs, ... }:

{

  # Various packages related to virtualization, compatability and sandboxing
  home.packages = with pkgs; [
    # Virtual Machines and wine
    bottles

    # Filesystems
    dosfstools
  ];

}
