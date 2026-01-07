{pkgs, ...}: {
  home.packages = with pkgs; [
    fishPlugins.tide #prompt
    fishPlugins.sponge #filters out typos
    fishPlugins.puffer #text expansions
    fishPlugins.plugin-sudope #input ``sudo`` with ``esc+esc``
    fishPlugins.fzf-fish # fzf keybindings
    fishPlugins.fish-you-should-use #alias reminder
    fishPlugins.fish-bd #command to go up in directory
    fishPlugins.colored-man-pages #does what it says
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = "microfetch";
    shellAliases = {
      build = "nh os switch ~/Nix --impure";
      update = "nh os switch -u -a ~/Nix --impure";
      preview = "nh os test -n ~/Nix --impure";
      scrub = "nh clean all --keep-since 7d, --keep 5";
      sweep = "nix-collect-garbage -v";
      assess = "nix-collect-garbage -v --dry-run";
    };
  };
}
