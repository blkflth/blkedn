{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  # Define a user account. set a password with ‘passwd’.
  users.users.jlc = {
    isNormalUser = true;
    description = "JLC";
    extraGroups = ["networkmanager" "wheel" "kvm" "libvirtd" "samba"];
    packages = with pkgs; [
      #  kdePackages.kate #useful to have on hand tbh!
      #  thunderbird
    ];
  };

  environment = {
    variables = {
      SHELL = "fish";
      EDITOR = "codium";
      VISUAL = "codium";
    };
  };

  # Define hostname.
  networking.hostName = "blkedn";
  networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocales = [
    "ja_JP.UTF-8/UTF-8"
  ];

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
}
